class AuthController < ApplicationController
  skip_before_action :authorize_request, only: :login
  skip_before_action :verify_session_csrf, only: :login

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
      remember = ActiveModel::Type::Boolean.new.cast(params[:IsRemember] || params[:remember])
      session, raw_token = AuthSession.issue_for(user, remember: remember)
      cookie_options = session_cookie_options.merge(value: raw_token)
      cookie_options[:expires] = session.expires_at if remember
      cookies[session_cookie_name] = cookie_options

      render json: {
        success: true,
        message: 'Login successful.',
        client_request_id: params[:ClientRequestId],
        csrf_token: session.csrf_token(raw_token),
        user: user_payload(user)
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
    render json: {
      user: user_payload(current_user),
      csrf_token: current_session.csrf_token(raw_session_token)
    }, status: :ok
  end

  def logout
    current_session.destroy!
    cookies.delete(session_cookie_name, session_cookie_options)
    head :no_content
  end

  private

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
