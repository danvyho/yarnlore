class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: %i[update destroy]

  def show
    @comments = @post.comments
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.parent_id = params[:parent_id] if params[:parent_id].present?
    if @comment.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("comments", partial: "shared/comments", locals: { comments: @post.comments, post: @post })
        end
        format.html { redirect_to @post, notice: "Comment was successfully created." }
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("comments", partial: "shared/comments", locals: { comments: @post.comments, post: @post })
        end
        format.html { redirect_to @post, alert: "Error creating comment." }
      end
    end
    Notification.create!(
      user: @post.user,
      post: @post,
      content: "#{current_user.username} commented your post!"
    )
  end

  def update
    if @comment.update(comment_params)
      redirect_to @post, notice: "Comment was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @post }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end
end
