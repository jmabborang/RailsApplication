class LoginLogs < ApplicationRecord
  self.table_name = 'tblLoginLogs'
  self.primary_key = 'Id'

  scope :recent_failures_for, lambda { |username, ip_address, since:|
    where(Username: username, IPAddress: ip_address, Status: %w[unauthorized rate_limited])
      .where('RequestTime >= ?', since)
  }
end
