json.extract! user, :id, :role_id, :first_name, :last_name, :major, :graduation_year, :email, :phone, :created_at, :updated_at
json.url user_url(user, format: :json)
