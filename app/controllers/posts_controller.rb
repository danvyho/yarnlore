class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]
  before_action :authenticate_user!, except: [:index]


  def index
    @posts = Post.all
    if params[:query].present?
      sql_subquery = <<~SQL
        posts.title ILIKE :query
        OR posts.content ILIKE :query
        OR users.username ILIKE :query
      SQL
      @posts = @posts.joins(:user).where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  def show
    @comments = @post.comments
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
    @post.user = current_user
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
    # raise
    if @post.user_id == current_user.id
      @post.destroy

    end
    redirect_to my_profile_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
