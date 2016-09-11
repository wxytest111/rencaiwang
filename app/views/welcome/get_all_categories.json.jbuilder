json.array!(@categoires) do |category|
  json.extract! category, :id, :title, :status, :on_left
  json.url "#{articles_path}?category_id=#{category.id}"
  json.regions do
    if category.on_left == 0
      @r = @regions.order('priority desc')
    else
      @r = @regions.order('priority asc')
    end
    json.array!(@r) do |region|
      json.extract! region, :id, :name
      json.url "#{articles_path}?category_id=#{category.id}&region_id=#{region.id}"
    end
  end

  json.articles do
    articles = category.articles.order('updated_at desc').limit(30)
    json.array!(articles) do |article|
      json.extract! article, :id, :title
      json.date article.updated_at.strftime('%m-%d')
      json.url article_url(article)
    end
  end
end