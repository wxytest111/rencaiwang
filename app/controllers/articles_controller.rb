class ArticlesController < ApplicationController
  load_and_authorize_resource
  before_action :set_bulletins, only: [:index, :show]
  # GET /articles
  # GET /articles.json
  def index
    category_id = params[:category_id] || 0
    @category = Category.find_by_id(category_id)
    region_id = params[:region_id] || 0
    @region = Region.find_by_id(region_id)
    if @category
      @articles = Article.where(category: @category)
    else
      @articles = Article.all
    end
    @articles = @articles.order('updated_at desc')
    @articles = @articles - @bulletins
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article.number = @article.number+1
    @article.save!
    set_bulletins
  end

  # GET /articles/new
  def new
    @article = Article.new
    @categories = Category.all
    @regions = current_user.regions
  end

  # GET /articles/1/edit
  def edit
    @categories = Category.all
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

  def set_bulletins
    bulletin_category = Category.find_by_title('公告栏')
    if bulletin_category
      @bulletins = Article.where(category: bulletin_category).order('updated_at desc').limit(30)
    else
      @bulletins = []
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:title, :source, :content, :region_id, :user_id, :category_id, :is_picture)
  end
end
