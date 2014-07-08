class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :poll_id
      t.string :answer
      t.integer :votes
      t.timestamps
    end
  end
end
