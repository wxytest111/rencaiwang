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

  json.pic_articles do
    articles = category.articles.where('cover_url is not null').order('updated_at desc').limit(6)
    json.array!(articles) do |article|
      json.extract! article, :id, :title, :cover_url, :is_picture, :updated_at
      if article.cover_url.include?('ckeditor_assets')
        json.cover article.cover_url.gsub('content', 'cover')
        json.tanchu_cover article.cover_url.gsub('content', 'tanchu')
      else
        json.cover article.cover_url
        json.tanchu_cover article.cover_url
      end
      json.date article.updated_at.strftime('%m-%d')
      json.url article_url(article)
    end
  end
end