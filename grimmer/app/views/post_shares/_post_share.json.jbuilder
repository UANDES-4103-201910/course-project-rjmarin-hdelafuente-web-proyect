json.extract! post_share, :id, :post_id, :user_id, :created_at, :updated_at
json.url post_share_url(post_share, format: :json)
