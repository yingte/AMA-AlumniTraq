# frozen_string_literal: true

json.extract!(media_handle, :id, :alumnus_id, :platform, :link, :created_at, :updated_at)
json.url(media_handle_url(media_handle, format: :json))
