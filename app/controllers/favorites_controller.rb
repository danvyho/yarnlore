class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all

  end

    def create
      @favorite = Favorite.new
      @favorite.user = current_user
      @favorite.post = Post.find(params[:id])
      @favorite.save!
    end
end
