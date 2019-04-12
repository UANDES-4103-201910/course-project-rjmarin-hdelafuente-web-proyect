json.extract! post, :id, :user_id, :title, :description, :city, :country, :location, :status, :visibility, :created_at, :updated_at
json.url post_url(post, format: :json)
