json.extract! calendarevent, :id, :title, :calendar_id, :start, :end, :location, :created_at, :updated_at
json.url calendarevent_url(calendarevent, format: :json)
