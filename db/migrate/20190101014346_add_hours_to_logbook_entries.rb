class AddHoursToLogbookEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :logbook_entries, :day_hours,   :integer
    add_column :logbook_entries, :night_hours, :integer
  end
end
