jq(->
  if(jq('#frameZ5VVE3').length > 0)
    jq.ajax({
      url: '/welcome/get_bulletins'
      dataType: 'json'
    }).done((res)->
      _.each(res, (bulletin)->
        jq.tmpl(jq('#bulletin-template').html(), bulletin).appendTo(jq('#frameZ5VVE3 .infoList'))
      )
      jQuery(".tebieniubi_twotop").slide({titCell: ".hd ul", mainCell: ".bd ul", autoPage: true, effect: "top", autoPlay: true, vis: 4})

    )

  if(jq('#frameM437or').length > 0)
    jq.ajax({
      url: '/welcome/get_all_categories.json'
      dataType: 'json'
    }).done((res)->
      count = 1
      articles = []
      _.each(res, (category)->
        if category.status != 'offline' && category.on_left == 0
          articles = articles.concat(category.articles)
          jq.tmpl(jq('#all-categories-tmpl').html(), category).appendTo(jq('#frameM437or'))
        else if category.status != 'offline' && category.on_left == 1
          if count %2 ==0
            category.className = 'evenLeval'
          category.count = count++
          articles = articles.concat(category.articles)
          jq.tmpl(jq('#nav-tmpl').html(), category).appendTo(jq('#nav'))
      )
      articles = _.shuffle(articles)
      for i in [1..20]
        if i<=10
          jq.tmpl(jq('#simple-article-tmpl').html(), articles[i]).appendTo(jq('#portal_block_53_content ul'))
        else
          jq.tmpl(jq('#simple-article-tmpl').html(), articles[i]).appendTo(jq('#portal_block_54_content ul'))

      jQuery("#nav").slide({
        type: "menu", #效果类型
        titCell: ".mainCate", #鼠标触发对象
        targetCell: ".subCate", #效果对象，必须被titCell包含
        delayTime: 0, #效果时间
        triggerTime: 0, #鼠标延迟触发时间
        defaultPlay: false, #默认执行
        returnDefault: true #返回默认
      })
    )


  jQuery("#iFocus li a").hover(->
    jq(this).css("opacity", 1).siblings().css("opacity", 0.7)
  , ->
    jq(this).css("opacity", 1).siblings().css("opacity", 1));
  jQuery("#iFocus").slide({ titCell: ".btn span", mainCell: "ul", effect: "left", autoPlay: true});


  if(jq('.picList').length > 0)
    for i in [1..25]
      jq.tmpl(jq('#gundong-template').html(), {}).appendTo(jq('.picList'))
    jQuery(".tebieniubi_left").slide({mainCell: ".bd ul", autoPlay: true, effect: "leftMarquee", vis: 7, interTime: 50, trigger: "click"})
)