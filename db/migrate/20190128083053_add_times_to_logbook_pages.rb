class AddTimesToLogbookPages < ActiveRecord::Migration[5.0]
  def change
    add_column :logbook_entries, :day_start_time,   :time
    add_column :logbook_entries, :day_end_time,     :time
    add_column :logbook_entries, :night_start_time, :time
    add_column :logbook_entries, :night_end_time,   :time
  end
end
