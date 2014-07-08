class AddExpirationToPoll < ActiveRecord::Migration
  def change
    add_column :polls, :expiration, :datetime, :default => Time.now + 20.hours
  end
end
