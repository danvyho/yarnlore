class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def show
  end
  
  def index
    @posts = Post.all
  end

<<<<<<< HEAD
  private

  def set_post
    @post = Post.find(params[:id])
=======
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
>>>>>>> edb55cf9f7cf59232c7af6688b415c70f1e37eed
  end
end

private

def post_params
  params.require(:post).permit(:title, :content)
end
 def set_post
   @set_post = Post.find(params[:id])
 end
