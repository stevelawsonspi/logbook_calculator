json.extract! logbook_page, :id, :logbook_id, :page_number, :created_at, :updated_at
json.url logbook_page_url(logbook_page, format: :json)
