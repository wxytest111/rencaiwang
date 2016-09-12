class WelcomeController < ApplicationController
  def index

  end

  def get_tebieniubi_nav
    @nav_menu = Category.where(status: Category.statuses[:on_menu]).order('priority asc')
  end

  def get_bulletins
    category = Category.find_by_title('公告栏')
    if category
      @bulletins = Article.where(category:category).order('updated_at desc').limit(10)
    else
      @bulletins = []
    end
  end

  def get_all_categories
    @regions = Region.all
    @categoires = Category.includes([articles:[]]).where("status!=#{Category.statuses[:offline]}")
  end

  def get_recommand_and_pic_articles
    @pic_articles = Article.where(is_picture: 1).order('updated_at desc').limit(25)
    @recommand_articles = Article.where(is_recommand: 1).order('updated_at desc').limit(21)
    @first_article = @recommand_articles.first
    @recommand_articles = @recommand_articles[1,@recommand_articles.length]
  end

end