json.extract! post_report, :id, :post_id, :user_id, :comment_report, :created_at, :updated_at
json.url post_report_url(post_report, format: :json)
