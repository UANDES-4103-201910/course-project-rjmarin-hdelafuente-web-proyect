json.extract! post_vote, :id, :post_id, :user_id, :vote, :created_at, :updated_at
json.url post_vote_url(post_vote, format: :json)
