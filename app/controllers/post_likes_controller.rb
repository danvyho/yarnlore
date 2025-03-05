class PostLikesController < ApplicationController

  def new
    @post_like = PostLike.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post_likes = @post.post_likes.new(user_id: current_user.id)
    respond_to do |format|
      if @post_likes.save
        format.turbo_stream
        format.html { redirect_to @post }
      else
        format.html { redirect_to @post }
      end
    end
  end

  private

  def post_like_params
    params.require(:post_likes).permit(:user_id, :post_id)
  end
end
