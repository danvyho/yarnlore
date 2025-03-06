class FavoritesController < ApplicationController
    def create
      @favorite = Favorite.new
      @favorite.user = current_user
      @favorite.post = Post.find(params[:id])
      @favorite.save!
    end
end
