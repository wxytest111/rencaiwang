module LinksHelper
  def link_status status
    case status
      when 'offline'
        text = '已下线'
      when 'online'
        text = '报名链接'
      when 'on_menu'
        text ='友情链接'
    end
    text
  end

  def status_for_select
    [['下线','offline'],['报名链接','baoming_link'], ['友情链接','friend_link']]
  end
end
