class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def show
  end

  private

  def set_post
    @set_post = Post.find(params[:id])
  end
end
