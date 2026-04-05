class AuthController < ActionController::API
  MOCK_USERS = [
    { username: 'test', password: 'p@ssw0rd', full_name: 'Test User', role: 'admin' },
    { username: 'demo', password: 'demo1234', full_name: 'Demo User', role: 'user' }
  ].freeze

  def login
    username = (params[:username] || params[:Username]).to_s.strip
    password = (params[:password] || params[:Password]).to_s

    
    if username.blank? || password.blank?
      return render json: {
        success: false,
        message: 'Username and password are required.'
      }, status: :unprocessable_entity
    end

    user = MOCK_USERS.find do |candidate|
      candidate[:username].casecmp?(username) && candidate[:password] == password
    end

    if user
      render json: {
        success: true,
        message: 'Login successful.',
        client_request_id: params[:ClientRequestId],
        user: {
          username: user[:username],
          full_name: user[:full_name],
          role: user[:role]
        }
      }, status: :ok
    else
      render json: {
        success: false,
        message: 'Invalid credentials.',
        client_request_id: params[:ClientRequestId]
      }, status: :unauthorized
    end
  end
end
