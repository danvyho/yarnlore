class CollectionsController < ApplicationController
  def index
    @collections = Collection.all
    @favorite = Favorite.new
  end

  def create
  end
end
