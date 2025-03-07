class UsersController < ApplicationController
  before_action :set_user, only: [:show]


  def show
  end

  def my_profile
    @is_following = false
    if params[:id]
      @user = User.find(params[:id])
      @is_following = Following.where(follower_id: current_user.id, followee_id: @user.id).size == 1
    else
      @user = current_user
    end
  end

  def my_notifications
    @user = current_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
