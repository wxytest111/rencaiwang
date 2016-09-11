json.array!(@bulletins) do |bulletin|
  json.extract! bulletin, :id, :title
  json.date bulletin.updated_at.strftime('%m-%d')
  json.url article_url(bulletin, format: :html)
end
