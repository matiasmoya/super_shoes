json.extract! article, :id, :name, :description, :price, :total_in_shelf, :total_in_vault, :store_id, :created_at, :updated_at
json.url article_url(article, format: :json)