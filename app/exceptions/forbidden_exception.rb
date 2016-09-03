class ForbiddenException < StandardError
  def status
    :forbidden
  end

  def message
    '您的权限无法进行当前操作'
  end
end
