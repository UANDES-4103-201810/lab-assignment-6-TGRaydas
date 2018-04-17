class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :is_user_logged_in?

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    #complete this method
    user = User.create(user_params)
    if user.save
      redirect_to root_url
    else
      redirect_to registrations_url
    end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    #complete this method
    user = User.find(params[:id])
    user.update(user_params)
    if user.save
      redirect_to user_url, notice: "Update was successfull"
    else
      redirect_to edit_user_url(params[:id]), notice: "Something was wrong"
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    #complete this method
    user = User.find(params[:id])
    if user.destroy
      redirect_to users_url, notice: "Deleted User Successfull"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :last_name, :email, :password, :phone)
    end
end
