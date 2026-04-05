class JsonWebToken
  ALGORITHM = 'HS256'

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, secret_key, ALGORITHM)
  end

  def self.decode(token)
    body = JWT.decode(token, secret_key, true, algorithm: ALGORITHM)[0]
    HashWithIndifferentAccess.new(body)
  rescue JWT::DecodeError, JWT::ExpiredSignature
    nil
  end

  def self.secret_key
    Rails.application.credentials.jwt_secret.presence || Rails.application.secret_key_base
  end
end
