class ApplicationController < ActionController::API
  include ActionController::Cookies

  before_action :verify_request_origin, if: :unsafe_request?
  before_action :authorize_request
  before_action :verify_session_csrf, if: :unsafe_request?
  after_action :prevent_sensitive_caching

  private

  attr_reader :current_user, :current_session, :raw_session_token

  def authorize_request
    @raw_session_token = cookies[session_cookie_name]
    @current_session = AuthSession.from_token(@raw_session_token)
    return render_unauthorized unless @current_session

    @current_user = User.find_by(Id: @current_session.user_id)
    return if @current_user

    @current_session.destroy!
    render_unauthorized
  end

  def verify_request_origin
    origin = request.headers['Origin'].to_s
    allowed_origins = Rails.application.config.x.frontend_origins
    return if origin.present? && (allowed_origins.include?(origin) || origin == request.base_url)

    render json: { error: 'Untrusted request origin' }, status: :forbidden
  end

  def verify_session_csrf
    supplied_token = request.headers['X-CSRF-Token']
    return if current_session&.valid_csrf_token?(supplied_token)

    render json: { error: 'Invalid CSRF token' }, status: :forbidden
  end

  def unsafe_request?
    !request.get? && !request.head? && !request.options?
  end

  def session_cookie_name
    Rails.env.production? ? '__Host-client_session' : 'client_session'
  end

  def session_cookie_options
    { httponly: true, secure: Rails.env.production?, same_site: :strict, path: '/' }
  end

  def render_unauthorized
    render json: { error: 'Unauthorized' }, status: :unauthorized
  end

  def prevent_sensitive_caching
    response.headers['Cache-Control'] = 'no-store'
  end
end
