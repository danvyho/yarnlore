class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.all
  end

  def show
  end


  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    redirect_to posts_path
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_path
  end

end

private

def post_params
  params.require(:post).permit(:title, :content)
end

 def set_post
   @post = Post.find(params[:id])
 end
