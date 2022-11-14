# frozen_string_literal: true

json.extract!(meeting, :id, :name, :start_time, :end_time, :description, :created_at, :updated_at)
json.url(meeting_url(meeting, format: :json))
