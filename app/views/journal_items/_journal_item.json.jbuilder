json.extract! journal_item, :id, :body, :published_at, :title, :created_at, :updated_at
json.url journal_item_url(journal_item, format: :json)
