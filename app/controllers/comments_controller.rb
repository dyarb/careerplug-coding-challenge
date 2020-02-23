class CommentsController < ApplicationController
  before_action :find_post

  def create
    @comment = @post.comments.create(comment_params)
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update
    @comment = @post.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to post_path(@post), flash: { success: 'Comment updated successfully' }
    else
      flash.now[:error] = 'There was an error updating your comment please try again'
      render :edit
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:name, :body)
  end
end
