class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites
  end

  def toggle
    @post = Post.find(params[:post_id])
    @favorite = @post.favorites.find_by(user: current_user)

    if @favorite
      @favorite.destroy
    else
      @favorite = @post.favorites.create(user_id: current_user.id)
    end

    @post.reload
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @post }
    end
  end

  private

  def favorite_params
    params.require(:favorites).permit(:user_id, :post_id)
  end
end
