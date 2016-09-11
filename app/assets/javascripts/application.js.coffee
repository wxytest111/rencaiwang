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

)