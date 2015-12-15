class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:index, :create]
  before_action :set_user, except: [:index, :create]

  def index
    @users = User.all
    render json: @users
  end


  def show
    render json: @user
  end


  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: 422
    end
  end


  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      head :no_content
    else
      render json: @user.errors, status: 422
    end
  end


  def destroy
    @user.destroy
    head :no_content
  end


################################

  def following
    @users = @user.following
    render json: @users
  end


  def followers
    @users = @user.followers
    render json: @users
  end

################################
  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first, :last, :username, :email, :password)
    end
end
