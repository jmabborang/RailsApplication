class AuthController < ApplicationController
  skip_before_action :authorize_request, only: [:login, :idle_expire]
  skip_before_action :verify_session_csrf, only: [:login, :idle_expire]

  def login
    username = (params[:username] || params[:Username]).to_s.strip
    password = (params[:password] || params[:Password]).to_s


    if username.blank? || password.blank?
      return render json: {
        success: false,
        message: 'Username and password are required.'
      }, status: :unprocessable_entity
    end

    user = User.find_by(LoginName: username)

    if user.present? && user.LoginAttemptsCount.to_i >= 3
      log_login_attempt(username: username, status: 'unauthorized')

      return render json: {
        success: false,
        message: 'Your account is locked. Please contact the administrator to unlock your account.',
        client_request_id: params[:ClientRequestId]
      }, status: :unauthorized
    end

    if user&.authenticate_password(password)
      log_login_attempt(username: username, status: 'ok')

      AuthSession.from_token(cookies[session_cookie_name])&.destroy!
      remember_value = params.key?(:IsRemember) ? params[:IsRemember] : params[:remember]
      remember = ActiveModel::Type::Boolean.new.cast(remember_value) == true
      session, raw_token = AuthSession.issue_for(user, remember: remember)
      set_session_cookie(raw_token, remember: remember)
      render json: {
        success: true,
        message: 'Login successful.',
        client_request_id: params[:ClientRequestId],
        user: user_payload(user),
        **session_details(session)
      }, status: :ok
    else
      attempts_count = nil

      if user.present?
        attempts_count = user.LoginAttemptsCount.to_i + 1
        user.update_column(:LoginAttemptsCount, attempts_count)
      end

      log_login_attempt(username: username, status: 'unauthorized')

      message = if attempts_count.to_i >= 3
        'Your account is locked. Please contact the administrator to unlock your account.'
      else
        'Invalid credentials.'
      end

      render json: {
        success: false,
        message: message,
        client_request_id: params[:ClientRequestId]
      }, status: :unauthorized
    end
  end

  def me
    renew_remembered_cookie!
    render json: {
      user: user_payload(current_user),
      **session_details(current_session)
    }, status: :ok
  end

  def heartbeat
    render json: {
      active: true,
      expires_in_seconds: current_session.expires_at ? [(current_session.expires_at - Time.current).ceil, 0].max : nil
    }, status: :ok
  end

  def idle_expire
    token = cookies[session_cookie_name]
    return render_unauthorized if token.blank?

    session = AuthSession.find_by(token_digest: AuthSession.digest(token), remembered: false)
    return render_unauthorized unless session
    unless session.valid_csrf_token?(request.headers['X-CSRF-Token'])
      return render json: { error: 'Invalid CSRF token' }, status: :forbidden
    end

    deleted = AuthSession.where(id: session.id).where('expires_at <= ?', Time.current).delete_all
    if deleted.positive?
      cookies.delete(session_cookie_name, session_cookie_options)
      head :no_content
    else
      session.reload
      render json: {
        active: true,
        expires_in_seconds: [(session.expires_at - Time.current).ceil, 0].max
      }, status: :ok
    end
  rescue ActiveRecord::RecordNotFound
    render_unauthorized
  end

  def activity
    expires_at = current_session.touch_activity!
    return render_unauthorized unless expires_at

    render json: {
      expires_at: expires_at.iso8601,
      expires_in_seconds: [(expires_at - Time.current).ceil, 0].max
    }, status: :ok
  end

  def refresh
    return render json: { error: 'Session is not remembered' }, status: :unprocessable_entity unless current_session.remembered?

    renew_remembered_cookie!
    render json: {
      next_rotation_at: current_session.next_rotation_at.iso8601,
      next_rotation_in_seconds: [(current_session.next_rotation_at - Time.current).ceil, 0].max
    }, status: :ok
  end

  def logout
    current_session.destroy!
    cookies.delete(session_cookie_name, session_cookie_options)
    head :no_content
  end

  private

  def set_session_cookie(raw_token, remember:)
    options = session_cookie_options.merge(value: raw_token)
    options[:expires] = 1.year.from_now if remember
    cookies[session_cookie_name] = options
  end

  def renew_remembered_cookie!
    next_token = current_session.rotate_token_if_due!(raw_session_token)
    set_session_cookie(next_token, remember: true) if next_token
  end

  def session_details(session)
    {
      csrf_token: session.csrf_token,
      remembered: session.remembered?,
      expires_at: session.expires_at&.iso8601,
      expires_in_seconds: session.expires_at ? [(session.expires_at - Time.current).ceil, 0].max : nil,
      next_rotation_at: session.remembered? ? session.next_rotation_at.iso8601 : nil,
      next_rotation_in_seconds: session.remembered? ? [(session.next_rotation_at - Time.current).ceil, 0].max : nil
    }
  end

  def user_payload(user)
    { id: user.Id, username: user.LoginName }
  end

  def log_login_attempt(username:, status:)
    LoginLogs.create(
      Username: username.to_s.presence || 'unknown',
      DeviceName: (params[:DeviceName] || params[:device_name]).to_s.presence,
      Status: status,
      IPAddress: logged_ip_address
    )
  rescue StandardError => e
    Rails.logger.error("Failed to save login log: #{e.class} #{e.message}")
  end

  def logged_ip_address
    request.remote_ip.to_s.presence || request.ip.to_s.presence || 'unknown'
  end
end
