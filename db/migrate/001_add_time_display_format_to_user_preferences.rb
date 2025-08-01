class AddTimeDisplayFormatToUserPreferences < ActiveRecord::Migration[5.2]
  def change
    add_column :user_preferences, :time_display_format, :string
  end
end