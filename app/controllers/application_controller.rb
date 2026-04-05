class ApplicationController < ActionController::API
  before_action :authorize_request

  private

  attr_reader :current_user

  def authorize_request
    token = bearer_token
    return render_unauthorized if token.blank?

    decoded = JsonWebToken.decode(token)
    return render_unauthorized if decoded.blank?

    @current_user = User.find_by(Id: decoded[:user_id])
    render_unauthorized if @current_user.nil?
  end

  def bearer_token
    header = request.headers['Authorization'].to_s
    scheme, token = header.split(' ', 2)
    return token if scheme&.casecmp?('Bearer') && token.present?

    nil
  end

  def render_unauthorized
    render json: { error: 'Unauthorized' }, status: :unauthorized
  end
end
