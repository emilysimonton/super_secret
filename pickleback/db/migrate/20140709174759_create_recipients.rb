class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :email
      t.integer :poll_id

      t.timestamps
    end
  end
end
