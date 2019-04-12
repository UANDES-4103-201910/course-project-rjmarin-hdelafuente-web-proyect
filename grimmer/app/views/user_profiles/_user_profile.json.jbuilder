json.extract! user_profile, :id, :user_id, :bio, :city, :country, :profile_picture, :location, :created_at, :updated_at
json.url user_profile_url(user_profile, format: :json)
