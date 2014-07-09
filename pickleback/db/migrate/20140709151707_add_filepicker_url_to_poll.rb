class AddFilepickerUrlToPoll < ActiveRecord::Migration
  def change
    add_column :polls, :filepicker_url, :string
  end
end
