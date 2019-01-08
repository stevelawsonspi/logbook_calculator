# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190101014346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "logbook_entries", force: :cascade do |t|
    t.integer  "logbook_page_id"
    t.integer  "day_minutes"
    t.integer  "night_minutes"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "day_hours"
    t.integer  "night_hours"
    t.index ["logbook_page_id"], name: "index_logbook_entries_on_logbook_page_id", using: :btree
  end

  create_table "logbook_pages", force: :cascade do |t|
    t.integer  "logbook_id"
    t.integer  "page_number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["logbook_id"], name: "index_logbook_pages_on_logbook_id", using: :btree
  end

  create_table "logbooks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "start_day_hours"
    t.integer  "start_day_minutes"
    t.integer  "start_night_hours"
    t.integer  "start_night_minutes"
  end

  add_foreign_key "logbook_entries", "logbook_pages"
  add_foreign_key "logbook_pages", "logbooks"
end
