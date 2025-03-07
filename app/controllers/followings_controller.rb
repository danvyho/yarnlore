class FollowingsController < ApplicationController
  before_action :set_user, only: [:follow_unfollow]

  def follow_unfollow # followings#create && followings#delete
    @is_following = Following.where(follower_id: current_user.id, followee_id: @user.id).size == 1
    if @is_following
      Following.where(follower_id: current_user.id, followee_id: @user.id).destroy_all
    else
      Following.create(follower_id: current_user.id, followee_id: @user.id)
    end

    redirect_to profile_path(@user)
  end

  def index
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
