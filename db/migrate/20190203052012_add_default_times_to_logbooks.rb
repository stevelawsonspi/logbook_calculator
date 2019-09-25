class AddDefaultTimesToLogbooks < ActiveRecord::Migration[5.0]
  def change
    add_column :logbooks, :start_page_number,        :integer
    add_column :logbooks, :default_day_start_time,   :time
    add_column :logbooks, :default_day_end_time,     :time
    add_column :logbooks, :default_night_start_time, :time
    add_column :logbooks, :default_night_end_time,   :time
  end
end
