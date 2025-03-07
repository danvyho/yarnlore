class CommentLikesController < ApplicationController

  def new
    @comment_like = CommentLike.new
  end

  def create
    @comment = Comment.find(params[:comment_id])
    @comment_like = @comment.comment_likes.new(user_id: current_user.id)
    respond_to do |format|
      if @comment_like.save
        format.turbo_stream
        format.html { redirect_to @comment.post }
      else
        format.html { redirect_to @comment.post }
      end
    end
    Notification.create!(
      user: @comment.user,
      post: @comment.post,
      content: "#{current_user.username} liked your comment!"
    )
  end

  private

  def comment_like_params
    params.require(:comment_like).permit(:user_id, :comment_id)
  end
end
