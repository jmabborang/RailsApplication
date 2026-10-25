require 'digest'
require 'openssl'
require 'securerandom'

class AuthSession < ApplicationRecord
  SHORT_LIFETIME = 12.hours
  REMEMBERED_LIFETIME = 30.days

  def self.issue_for(user, remember: false)
    raw_token = SecureRandom.hex(32)
    lifetime = remember ? REMEMBERED_LIFETIME : SHORT_LIFETIME
    session = create!(
      user_id: user.Id,
      token_digest: digest(raw_token),
      expires_at: lifetime.from_now
    )
    [session, raw_token]
  end

  def self.from_token(raw_token)
    return nil if raw_token.blank?

    session = find_by(token_digest: digest(raw_token))
    session if session && session.expires_at.future?
  end

  def self.digest(value)
    Digest::SHA256.hexdigest(value)
  end

  def self.prune_expired!
    where('expires_at <= ?', Time.current).delete_all
  end

  def csrf_token(raw_token)
    OpenSSL::HMAC.hexdigest('SHA256', Rails.application.secret_key_base, "csrf:#{raw_token}")
  end

  def valid_csrf_token?(raw_token, supplied_token)
    supplied_token.present? && ActiveSupport::SecurityUtils.secure_compare(
      csrf_token(raw_token), supplied_token.to_s
    )
  end
end
