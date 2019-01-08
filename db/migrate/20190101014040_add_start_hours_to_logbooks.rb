class AddStartHoursToLogbooks < ActiveRecord::Migration[5.0]
  def change
    add_column :logbooks, :start_day_hours,     :integer
    add_column :logbooks, :start_day_minutes,   :integer
    add_column :logbooks, :start_night_hours,   :integer
    add_column :logbooks, :start_night_minutes, :integer
  end
end
