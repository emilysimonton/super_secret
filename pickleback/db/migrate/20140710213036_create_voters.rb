class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.string :uuid
    end
  end
end
