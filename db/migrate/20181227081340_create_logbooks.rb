class CreateLogbooks < ActiveRecord::Migration[5.0]
  def change
    create_table :logbooks do |t|
      t.string :name

      t.timestamps
    end
  end
end
