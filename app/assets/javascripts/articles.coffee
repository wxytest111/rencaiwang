# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require bootstrap.min.js
#= require ckeditor/init
#= require utils/dialog
#= require jquery.blockUI

$ ->
  articleStatus = (status)->
    if status == 'offline'
      '不显示'
    else if  status == 'online'
      '显示中'

  changeArticleStatus = (params)->
    $.blockUI({message:'请稍等'})
    $.ajax({
      url: '/articles/'+params.id+'.json'
      data: params
      dataType: 'json',
      method: 'post',
      statusCode:{
        200: ->
          $.unblockUI()
          window.location.reload()
          alert('更新成功')
        422: ->
          $.unblockUI()
          alert('系统错误，请联系技术人员支持')
        500: ->
          $.unblockUI()
          alert('系统错误，请联系技术人员支持')
      }

    })
  $('body').delegate('.change-status', 'click', ->
    title = $(@).data('title')
    status = $(@).data('current')
    if status == 'offline'
      next = 'online'
    else
      next = 'offline'
    Tools.Dialog({
      title: "更新<span class='someblue'>["+$(@).data('title')+"]</span>文章状态"
      content: "当前文章状态为:<span class='someblue'>"+articleStatus(status)+"</span>,是否更新为:<span class='red'>"+ articleStatus(next)+"</span>?"
    })
    params = {
      id: $(@).data('id'),
      article: {
        status: next
      },
      _method: 'put',
      authenticity_token: $('meta[name="csrf-token"]').attr('content')
    }
    $('#myModal').modal()
    $('#myModal').delegate('.btn-primary', 'click', ->
      changeArticleStatus(params)
      $('#myModal').modal('hide')
    )
  )
