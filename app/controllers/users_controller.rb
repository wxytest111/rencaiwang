require 'pp'

class UsersController < RoleAuthenticationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :get_nav
  before_action :set_params, only: [:user_new, :edit, :user_create, :show]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @regions = Region.all
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    respond_to do |format|
      if user_update_transaction('create')
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if user_update_transaction('update')
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def user_new
    @user = User.new
  end

  def user_create
    respond_to do |format|
      if user_update_transaction('create')
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'user_new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_params
      @regions = Region.all
      @categories = Category.child_categories
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

  def region_params
    params.require(:regions)
  end

  def roles_param
    params.require(:roles)
  end

  def categories_param
    params.require(:categories)
  end

  def user_update_transaction type
    begin
      User.transaction do
        if type == 'create'
          @user = User.new(user_params)
          @user.save!
        else
          @user.update(user_params)
        end
        user_regions = UserRegion.where(user:@user)
        if user_regions && user_regions.length>0
          user_regions.each {|user_region| user_region.delete}
        end

        roles_param.each do |role_name, checked|
          @user.add_role(role_name) if checked == '1' && !@user.has_role?(role_name)
          @user.remove_role(role_name) if checked == '0' && @user.has_role?(role_name)
        end

        region_params.each do |key, value|
          if value.to_i == 1
            UserRegion.create!(user_id:@user.id, region_id: key)
          end
        end

        categories_param.each do |key ,value|
          pp "key=#{key}, value=#{value}"
          if value.to_i == 1
            UserCategory.create!(user_id:@user.id, category_id: key)
          end
        end

      end
      true
    rescue Exception => e
      false
    end
  end
end
