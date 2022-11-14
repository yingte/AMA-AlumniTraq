# frozen_string_literal: true

json.extract!(event_attendee, :id, :meeting_id, :user_id, :created_at, :updated_at)
json.url(event_attendee_url(event_attendee, format: :json))
