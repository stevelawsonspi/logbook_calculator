class CreateLogbookEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :logbook_entries do |t|
      t.references :logbook_page, foreign_key: true
      t.integer :day_minutes
      t.integer :night_minutes

      t.timestamps
    end
  end
end
