class AddTokenToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :token, :string
  end
end
