class AddDefaultToOptionsVotes < ActiveRecord::Migration
  def change
    change_column_default :options, :votes, 0
  end
end
