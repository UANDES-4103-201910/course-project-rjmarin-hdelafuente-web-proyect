json.extract! user, :id, :email, :password, :roles_mask, :created_at, :updated_at
json.url user_url(user, format: :json)
