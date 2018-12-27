class CreateLogbookPages < ActiveRecord::Migration[5.0]
  def change
    create_table :logbook_pages do |t|
      t.references :logbook, foreign_key: true
      t.integer :page_number

      t.timestamps
    end
  end
end
