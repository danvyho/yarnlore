class UsersController < ApplicationController
  # before_action :set_user, only: [:show]

  def my_profile
    @is_following = false
    @user = current_user
    if params[:id]
      @user = User.find(params[:id])
      @is_following = Following.where(follower_id: current_user.id, followee_id: @user.id).size == 1
    end
    if current_user == nil
      redirect_to new_user_session_path
    end
  end

  def my_notifications
    @user = current_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  def set_post
    @post = Post.find(params[:id])
  end

end
