json.extract! post, :id, :source, :image_url, :caption, :posted_at, :instagram_url, :created_at, :updated_at
json.url post_url(post, format: :json)
