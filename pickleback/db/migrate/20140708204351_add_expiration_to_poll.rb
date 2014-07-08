class AddExpirationToPoll < ActiveRecord::Migration
  def change
    add_column :polls, :expiration, :datetime
  end
end
