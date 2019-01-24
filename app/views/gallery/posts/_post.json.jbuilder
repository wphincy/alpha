json.extract! post, :id, :catagory, :title, :description, :comments, :keyword, :numphoto, :slug, :created_at, :updated_at
json.url post_url(post, format: :json)
