class User < ApplicationRecord
  self.table_name = 'tblUsers'
  self.primary_key = 'Id'
end
