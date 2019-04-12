json.extract! post_comment, :id, :post_id, :user_id, :comment, :created_at, :updated_at
json.url post_comment_url(post_comment, format: :json)
