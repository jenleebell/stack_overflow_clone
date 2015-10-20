class UsersController < ApplicationController
  before_filter :authorize_admin, only: :index
  def index
    @users = User.all
    @todaysposts = Post.todays_posts
    @numberofposts = Post.number_of_todays_posts
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :admin)
  end
end
