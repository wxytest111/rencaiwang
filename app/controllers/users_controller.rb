require 'pp'

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

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
    @regions = Region.all
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
    @regions = Region.all
  end

  def user_create
    @regions = Region.all
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

  def user_update_transaction type
    begin
      User.transaction do
        # require 'byebug';byebug
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
        region_params.each do |key, value|
          pp "key=#{key}, value=#{value}"
          if value.to_i == 1
            UserRegion.create!(user_id:@user.id, region_id: key)
          end
        end
      end
      true
    rescue Exception => e
      false
    end
  end
end
