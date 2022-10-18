# frozen_string_literal: true

json.extract!(major, :id, :name, :created_at, :updated_at)
json.url(major_url(major, format: :json))
