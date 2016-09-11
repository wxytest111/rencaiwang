class WelcomeController < ApplicationController
  def index

  end

  def get_tebieniubi_nav
    @nav_menu = Category.where(status: Category.statuses[:on_menu])
  end

  def get_bulletins
    category = Category.find_by_title('公告栏')
    if category
      @bulletins = Article.where(category:category).order('updated_at desc').limit(10)
    else
      @bulletins = []
    end
  end
end