class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
  end

  def my_profile
    @user = current_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
