module CategoriesHelper
  def category_status status
    case status
      when 'offline'
        text = '已下线'
      when 'online'
        text = '在线但不出现在导航上'
      when 'on_menu'
        text ='可以出现在导航上'
    end
    text
  end

  def show_status
    [['下线','offline'],['在线但不出现在导航上','online'], ['可以出现在导航上','on_menu']]
  end
end
