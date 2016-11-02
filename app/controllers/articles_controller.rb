class ArticlesController < ApplicationController
  load_and_authorize_resource
  before_action :get_nav
  # GET /articles
  # GET /articles.json
  def index
    @keyword = params[:keyword] || ''
    category_id = params[:category_id] || 0
    @category = Category.find_by_id(category_id) || Category.parent_categories.first
    set_sub_nav
    region_id = params[:region_id] || 0
    @region = Region.find_by_id(region_id)
    if @keyword != ''
      @articles = Article.where("title like '%#{@keyword}%'").paginate(page: params[:page], per_page: APP_CONFIG['page_size'])
    else

      if @category
        if @category.parent_id.present?
          @articles = Article.where(category: @category).paginate(page: params[:page], per_page: APP_CONFIG['page_size'])
        else
          @articles = Article.where(category: @category.children_categories).paginate(page: params[:page], per_page: APP_CONFIG['page_size'])
        end
      else
        @articles = Article.all.paginate(page: params[:page], per_page: APP_CONFIG['page_size'])
      end
    end
    if @region
      @articles = @articles.where(region: @region)
    end
    @articles = @articles.order('updated_at desc')

    if current_user && current_user.has_any_role?(:super_admin,:content_admin)
      #do nothing now
    else
      @articles = @articles.where(status: Article.statuses[:online])
    end
  end


  # GET /articles/1
  # GET /articles/1.json
  def show
    @article.number = @article.number+1
    @article.save!
    @category = @article.category
    set_sub_nav
  end

  # GET /articles/new
  def new
    @article = Article.new
    @categories = current_user.categories
    @regions = current_user.regions
  end

  # GET /articles/1/edit
  def edit
    @categories = current_user.categories
    @regions = current_user.regions
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  def set_sub_nav
    if @category.parent_id
      @grand_parent_category = Category.find_by_id(@category.parent_id)
    else
      @grand_parent_category = @category
    end
    @sibling_categories = @grand_parent_category.children_categories
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:title, :source, :content, :region_id, :user_id, :category_id, :is_picture, :is_recommand, :status)
  end
end
