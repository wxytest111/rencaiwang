#=require 'underscore'
#=require 'jquery.tmpl'

jq(->
  if(jq('.tebieniubi_nav').length>0)

    jq.ajax({
      url: '/welcome/get_tebieniubi_nav'
      dataType: 'json'
    }).done((res)->
      _.each(res, (menu)->
        jq('.tebieniubi_nav ul').append("<li><a hidefocus='true' href='/articles?category_id=#{menu.id}'>#{menu.title}</a></li>")
      )
    )

  if(jq('#frameZ5VVE3').length>0)
    alert(1)
    jq.ajax({
      url: '/welcome/get_bulletins'
      dataType: 'json'
    }).done((res)->
      console.log res
      _.each(res, (bulletin)->
        console.log bulletin
        jq.tmpl(jq('#bulletin-template').html(), bulletin).appendTo(jq('#frameZ5VVE3 .infoList'))
#        jq('.tebieniubi_nav ul').append("<li><a hidefocus='true' href='/articles?category_id=#{menu.id}'>#{menu.title}</a></li>")
      )
    )
)