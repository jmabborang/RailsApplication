class CreateAuthSessions < ActiveRecord::Migration[8.1]
  def change
    create_table :auth_sessions do |t|
      t.bigint :user_id, null: false
      t.string :token_digest, limit: 64, null: false
      t.datetime :expires_at, null: false
      t.timestamps
    end

    add_index :auth_sessions, :token_digest, unique: true
    add_index :auth_sessions, :user_id
    add_index :auth_sessions, :expires_at
  end
end
