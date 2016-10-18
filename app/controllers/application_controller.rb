class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def get_nav
    category_id = params[:category_id]
    if category_id
      @current_category = Category.find_by_id(category_id)
    end

    @nav_menu = Category.where(status: Category.statuses[:on_menu], parent_id:nil).order('priority asc').limit(6)
    @nav_class = ''
    @nav_menu.each_with_index do |nav, index|
      if nav==@current_category || nav.children_categories.include?(@current_category)
        @nav_class="nav-#{index+1}"
      end
    end
  end
end
