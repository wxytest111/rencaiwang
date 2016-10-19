module CategoriesHelper
  def category_status status
    case status
      when 'offline'
        text = '已下线'
      when 'online'
        text = '在线上'
      when 'on_menu'
        text ='可以在首页或二级分类页显示出来'
    end
    text
  end

  def show_status
    [['下线','offline'],['在线','online'], ['可以在首页或二级分类页显示出来','on_menu']]
  end
end
