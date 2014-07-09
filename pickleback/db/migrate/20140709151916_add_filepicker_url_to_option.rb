class AddFilepickerUrlToOption < ActiveRecord::Migration
  def change
    add_column :options, :filepicker_url, :string
  end
end
