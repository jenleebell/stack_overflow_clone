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
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
