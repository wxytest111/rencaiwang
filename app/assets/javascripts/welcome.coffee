jq(->
  if(jq('#frameM437or').length > 0)
    jq.ajax({
      url: '/welcome/get_all_categories.json'
      dataType: 'json'
    }).done((res)->
      count = 1
      _.each(res, (category)->
        if category.status != 'offline' && category.title!='公告栏' && category.on_left == 0
          jq.tmpl(jq('#all-categories-tmpl').html(), category).appendTo(jq('#frameM437or'))
        else if category.status != 'offline' && category.title!='公告栏' && category.on_left == 1
          if count % 2 == 0
            category.className = 'evenLeval'
          category.count = count++
          jq.tmpl(jq('#nav-tmpl').html(), category).appendTo(jq('#nav'))
        else if category.status != 'offline' && category.title == '公告栏'
          _.each(category.articles, (article)->
            jq.tmpl(jq('#bulletin-template').html(), article).appendTo(jq('#frameZ5VVE3 .infoList'))
          )
          jQuery(".tebieniubi_twotop").slide({titCell: ".hd ul", mainCell: ".bd ul", autoPage: true, effect: "top", autoPlay: true, vis: 4})
      )

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


  jq.ajax({
    url: '/welcome/get_recommand_and_pic_articles.json'
    dataType: 'json'
  }).done((res)->
    # 最中间的跑马灯区域
    jq.tmpl(jq('#i-focus-tmpl').html(), res).appendTo(jq('#iFocus'))
    jQuery("#iFocus li a").hover(->
      jq(this).css("opacity", 1).siblings().css("opacity", 0.7)
    , ->
      jq(this).css("opacity", 1).siblings().css("opacity", 1));
    jQuery("#iFocus").slide({ titCell: ".btn span", mainCell: "ul", effect: "left", autoPlay: true});
    # 中间图文滚动 picList
    pic_articles = res.pic_articles
    _.each(pic_articles, (article)->
      jq.tmpl(jq('#pic-list-template').html(), article).appendTo(jq('.picList'))
    )
    jQuery(".tebieniubi_left").slide({
        mainCell: ".bd ul",
        autoPlay: true,
        effect: "leftMarquee",
        vis: 7,
        interTime: 50,
        trigger: "click"
      }
    )

    recommand_articles = res.recommand_articles
    _.each(recommand_articles, (article, i)->
      if i < 10
        jq.tmpl(jq('#simple-article-tmpl').html(), article).appendTo(jq('#portal_block_53_content ul'))
      else if i < 20
        jq.tmpl(jq('#simple-article-tmpl').html(), article).appendTo(jq('#portal_block_54_content ul'))
    )

    first_article = res.first_article
    jq.tmpl(jq('#first-article-tmpl').html(), first_article).prependTo(jq('.tebieniubi_toutiao .bw0'))

  )
)