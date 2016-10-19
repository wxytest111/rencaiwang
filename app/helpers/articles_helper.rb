module ArticlesHelper
  def article_status article
    if article.status == 'offline'
      '不显示'
    elsif article.status == 'online'
      '显示中'
    end
  end
end
