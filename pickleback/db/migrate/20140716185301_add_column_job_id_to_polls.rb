class AddColumnJobIdToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :job_id, :integer
  end
end
