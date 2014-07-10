class DropRecipientsTable < ActiveRecord::Migration
  def up
    drop_table :recipients
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
