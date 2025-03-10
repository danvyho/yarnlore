class FollowingsController < ApplicationController
  before_action :set_user, only: [:follow_unfollow, :index_followers, :index_followings]

  def follow_unfollow # followings#create && followings#delete
    @is_following = Following.where(follower_id: current_user.id, followee_id: @user.id).size == 1
    if @is_following
      Following.where(follower_id: current_user.id, followee_id: @user.id).destroy_all
    else
      Following.create(follower_id: current_user.id, followee_id: @user.id)
      Notification.create!(
        user: @user,
        post: current_user.posts.first || Post.first,
        content: "#{current_user.username} started following you!"
      )
    end

    redirect_to user_path(@user)
  end

  def index_followers
    @followers = Following.where(followee_id: @user.id).map(&:follower)
  end

  def index_followings
    @followings = Following.where(follower_id: @user.id).map(&:followee)
  end
  private

  def set_user
    @user = User.find(params[:id])
  end
end
