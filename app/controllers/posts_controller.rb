class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    if current_user
    @posts = current_user.followees.map(&:posts).flatten
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc)  # Ensure comments are loaded
  end

  def new
    @post = Post.new
    @post.pattern = false
    @post.type = "post"
  end

  def edit
    @post = Post.find(params[:id])
    @post.pattern == true ? @post.type = "pattern" : @post.type = "post"
  end

  def create
    @post = Post.new(post_params.except(:type))
    if params[:post][:type] == "pattern"
      @post.pattern = true
    elsif params[:post][:type] == "post"
      @post.pattern = false
    end

    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def patterns
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

  def update
    @post = Post.find(params[:id])
    if params[:post][:type] == "pattern"
      @post.pattern = true
    elsif params[:post][:type] == "post"
      @post.pattern = false
    end

    if @post.update(post_params.except(:type))
      redirect_to post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.user_id == current_user.id
      @post.destroy

    end
    redirect_to my_profile_path
  end

  def patterns
    @patterns = Post.where(pattern: true)
  end

  private

  def post_params
    params.require(:post).permit(:id, :title, :content, :image, :yarn_weight, :gauge, :needle_size, :craft, :category, :type)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
