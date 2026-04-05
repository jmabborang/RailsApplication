class User < ApplicationRecord
  self.table_name = 'tblUsers'
  self.primary_key = 'Id'

  def password=(raw_password)
    self[:PasswordHash] = BCrypt::Password.create(raw_password, cost: BCrypt::Engine.cost).to_s
  end

  def authenticate_password(raw_password)
    stored_password_hash = self[:PasswordHash].to_s
    return false if stored_password_hash.blank? || raw_password.blank?

    BCrypt::Password.new(stored_password_hash).is_password?(raw_password)
    rescue BCrypt::Errors::InvalidHash
    false
  end
end
