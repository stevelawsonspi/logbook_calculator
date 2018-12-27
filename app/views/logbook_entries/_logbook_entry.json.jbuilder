json.extract! logbook_entry, :id, :logbook_page_id, :day_minutes, :night_minutes, :created_at, :updated_at
json.url logbook_entry_url(logbook_entry, format: :json)
