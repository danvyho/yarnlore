class PostLikesController < ApplicationController

  def new
    @post_like = PostLike.new
  end

  def toggle
    @post = Post.find(params[:post_id])
    if current_user.present?
      @post_like = @post.post_likes.find_by(user_id: current_user.id)
      if @post_like
        @post_like.destroy
      else
        @post_like = @post.post_likes.create(user_id: current_user.id)
      end
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @post }
      end
      Notification.create!(
        user: @post.user,
        post: @post,
        content: "#{current_user.username} liked your post!"
      )
    else
      if @post_like
        redirect_to new_user_session_path
      end
    end

  end

  private

  def post_like_params
    params.require(:post_likes).permit(:user_id, :post_id)
  end
end
