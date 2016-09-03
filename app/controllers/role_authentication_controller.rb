class RoleAuthenticationController < ApplicationController
  before_action :store_location
  before_action :authenticate_user!
  rescue_from ForbiddenException, with: :handle_errors

  def handle_errors(error)
    render text: error.message, status: error.status
  end


  def store_location
    return unless request.get?
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end
end
