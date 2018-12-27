json.extract! logbook, :id, :name, :created_at, :updated_at
json.url logbook_url(logbook, format: :json)
