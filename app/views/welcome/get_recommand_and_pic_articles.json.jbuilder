json.pic_articles do
  json.array! @pic_articles do |article|
    json.extract! article, :id, :title
    json.url article_url(article)
    if article.cover_url.include?('ckeditor_assets')
      json.slide article.cover_url.gsub('content', 'slide')
      json.pic_list_src article.cover_url.gsub('content', 'thumb')
    else
      json.slide article.cover_url
      json.pic_list_src article.cover_url
    end
  end
end

json.recommand_articles do
  json.array! @pic_articles do |article|
    json.extract! article, :id, :title
    json.url article_url(article)
  end
end

json.first_article do
  json.extract! @first_article, :id, :title
  json.url article_url(@first_article)
  json.category_name @first_article.category.try(:title)
  json.summary Nokogiri::HTML(@first_article.content).text.gsub(/\r\n/, '')[0, 115]
end