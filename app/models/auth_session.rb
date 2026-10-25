require 'digest'
require 'openssl'
require 'securerandom'

class AuthSession < ApplicationRecord
  IDLE_TIMEOUT = 5.minutes
  ROTATION_INTERVAL = 5.minutes
  PREVIOUS_TOKEN_GRACE = 30.seconds

  def self.issue_for(user, remember: false)
    raw_token = SecureRandom.hex(32)
    now = Time.current
    session = create!(
      user_id: user.Id,
      token_digest: digest(raw_token),
      remembered: remember,
      expires_at: remember ? nil : now + IDLE_TIMEOUT,
      rotated_at: now
    )
    [session, raw_token]
  end

  def self.from_token(raw_token)
    return nil if raw_token.blank?

    token_digest = digest(raw_token)
    session = find_by(token_digest: token_digest)
    return session if active_or_prune(session)

    session = find_by(previous_token_digest: token_digest)
    session if active_or_prune(session) && session.previous_token_valid_until&.future?
  end

  def self.active_or_prune(session)
    return false unless session
    return true if session.active?

    deleted = where(id: session.id).where('expires_at <= ?', Time.current).delete_all
    deleted.zero? && session.reload.active?
  rescue ActiveRecord::RecordNotFound
    false
  end
  private_class_method :active_or_prune

  def self.digest(value)
    Digest::SHA256.hexdigest(value)
  end

  def self.prune_expired!
    where('expires_at <= ?', Time.current).delete_all
  end

  def active?
    remembered? || expires_at&.future?
  end

  def current_token?(raw_token)
    token_digest == self.class.digest(raw_token)
  end

  def touch_activity!
    return nil if remembered?

    with_lock do
      return nil unless active?

      now = Time.current
      update_columns(expires_at: now + IDLE_TIMEOUT, updated_at: now)
      expires_at
    end
  end

  def rotate_token_if_due!(raw_token)
    return nil unless remembered?

    with_lock do
      now = Time.current
      return nil unless current_token?(raw_token)
      return nil if (rotated_at || created_at) > now - ROTATION_INTERVAL

      next_token = SecureRandom.hex(32)
      update_columns(
        token_digest: self.class.digest(next_token),
        previous_token_digest: token_digest,
        previous_token_valid_until: now + PREVIOUS_TOKEN_GRACE,
        rotated_at: now,
        updated_at: now
      )
      next_token
    end
  end

  def next_rotation_at
    (rotated_at || created_at) + ROTATION_INTERVAL
  end

  def csrf_token
    OpenSSL::HMAC.hexdigest('SHA256', Rails.application.secret_key_base, "csrf:auth_session:#{id}")
  end

  def valid_csrf_token?(supplied_token)
    supplied_token.present? && ActiveSupport::SecurityUtils.secure_compare(
      csrf_token, supplied_token.to_s
    )
  end
end
