class CommentLikesController < ApplicationController

  def new
    @comment_like = CommentLike.new
  end

  def toggle
    @comment = Comment.find(params[:comment_id])
    @comment_like = @comment.comment_likes.find_by(user: current_user)

    if @comment_like
      @comment_like.destroy
    else
      @comment_like = @comment.comment_likes.create(user: current_user)
      # Create a notification when a like is added.
      Notification.create!(
        user: @comment.user,
        post: @comment.post,
        content: "#{current_user.username} liked your comment!"
      )
    end

    respond_to do |format|
      format.turbo_stream  # This should render a turbo stream view that updates the like counter on the comment.
      format.html { redirect_to @comment.post }
    end
  end

  private

  def comment_like_params
    params.require(:comment_like).permit(:user_id, :comment_id)
  end
end
