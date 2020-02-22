class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post), flash: { success: 'Your post was saved successfully' }
    else
      flash.now[:error] = 'There was an error saving your post please try again'
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to post_path(@post), flash: { success: 'Your post was edited successfully' }
    else
      flash.now[:error] = 'There was an error editing your post please try again'
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_path, flash: { success: 'Your post was deleted successfully' } }
      format.js
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
