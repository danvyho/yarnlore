class UsersController < ApplicationController
  before_action :set_user, only: [:show]


  def show
  end

  def my_profile
    if params[:id]
      @user = User.find(params[:id])
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
