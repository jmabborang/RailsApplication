class Db
  def self.transaction(&block)
    ActiveRecord::Base.transaction(&block)
  end
end
