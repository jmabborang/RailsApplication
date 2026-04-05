class AuthController < ApplicationController
  skip_before_action :authorize_request, only: :login

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

      token = JsonWebToken.encode(user_id: user.Id)

      render json: {
        success: true,
        message: 'Login successful.',
        client_request_id: params[:ClientRequestId],
        token: token,
        token_type: 'Bearer',
        user: {
          id: user.Id,
          username: user.LoginName
        }
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

  private
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
    supplied_ip = (params[:IPAddress] || params[:ip_address]).to_s.strip
    return supplied_ip if supplied_ip.present?

    request.remote_ip.to_s.presence || request.ip.to_s.presence || 'unknown'
  end
end
