class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to restaurants_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end

private

def post_params
  params.require(:post).permit(:title, :content)
end
