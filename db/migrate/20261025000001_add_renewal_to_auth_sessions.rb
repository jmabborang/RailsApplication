class AddRenewalToAuthSessions < ActiveRecord::Migration[8.1]
  def up
    remove_index :auth_sessions, :expires_at
    set_expiry_nullable(true)
    add_index :auth_sessions, :expires_at
    add_column :auth_sessions, :remembered, :boolean, default: false, null: false
    add_column :auth_sessions, :rotated_at, :datetime
    add_column :auth_sessions, :previous_token_digest, :string, limit: 64
    add_column :auth_sessions, :previous_token_valid_until, :datetime
    add_index :auth_sessions, :previous_token_digest
    execute 'UPDATE auth_sessions SET expires_at = CURRENT_TIMESTAMP'
  end

  def down
    remove_index :auth_sessions, :previous_token_digest
    remove_column :auth_sessions, :previous_token_valid_until
    remove_column :auth_sessions, :previous_token_digest
    remove_column :auth_sessions, :rotated_at
    remove_column :auth_sessions, :remembered
    execute 'UPDATE auth_sessions SET expires_at = CURRENT_TIMESTAMP WHERE expires_at IS NULL'
    remove_index :auth_sessions, :expires_at
    set_expiry_nullable(false)
    add_index :auth_sessions, :expires_at
  end

  private

  def set_expiry_nullable(nullable)
    if connection.adapter_name.downcase.include?('sqlserver')
      execute "ALTER TABLE auth_sessions ALTER COLUMN expires_at datetime #{nullable ? 'NULL' : 'NOT NULL'}"
    else
      change_column_null :auth_sessions, :expires_at, nullable
    end
  end
end
