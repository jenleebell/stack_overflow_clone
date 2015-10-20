class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.votes = 0
    if @post.save
      current_user.posts.push(@post)
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    # binding.pry
  end

  def edit
    @post = Post.find(params[:id])
    if params[:upvote]
      new_vote = @post.votes + 1
      @post.update(votes: new_vote)
      redirect_to post_path(@post)
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end

private
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
