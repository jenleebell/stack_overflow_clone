class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @post.comments.push(@comment)
    current_user.comments.push(@comment)
    if @comment.save
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if params[:best] == "true"
      if @post.comments.where(best: true).count == 0
        @comment.update(best: true)
      end
    else
      @comment.update(comment_params)
    end
    redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, :best)
  end
end
