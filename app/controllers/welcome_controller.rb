class WelcomeController < ApplicationController
  before_action :get_nav

  def index
    @show_categories = Category.where(title:['公告','通知','综合新闻','人才工作专题'])
    @recommand_articles = Article.where(is_recommand: 1).order('updated_at desc').limit(5)
    @baoming_links = Link.where(status: Link.statuses[:baoming_link]).order('priority asc').limit(10)
    @friend_links = Link.where(status: Link.statuses[:friend_link]).order('priority asc').limit(10)
  end

  def get_tebieniubi_nav
    @nav_menu = Category.where(status: Category.statuses[:on_menu], parent_id:nil).order('priority asc').limit(6)
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