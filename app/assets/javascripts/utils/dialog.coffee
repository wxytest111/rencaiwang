ns 'Tools', (ns)->
  ns.Dialog = (options) ->
    template = "<div class=\"modal fade modal\" role=\"dialog\" aria-labelledby=\"myModalLabel\" id=\"myModal\">
      <div class=\"modal-dialog\">
        <div class=\"modal-content\">
          <div class=\"modal-header\">
            <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>
            <h4 class=\"modal-title center bold\">#{options.title}</h4>
          </div>
          <div class=\"modal-body\">
            <p>#{options.content}</p>
          </div>
          <div class=\"modal-footer\">
            <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">取消</button>
            <button type=\"button\" class=\"btn btn-primary\">确认</button>
          </div>
        </div>
      </div>
    </div>"

    $('body').append(template)
    $('#myModal').on('hidden.bs.modal', ->
      $('#myModal').remove()
    )