class FavoritesController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :post_image_params, only: [:create, :destroy]

  def create
     post_image = PostImage.find(params[:post_image_id])
     favorite = current_user.favorites.new(post_image_id: post_image.id)
     favorite.save
     #redirect_to post_image_path(post_image)
    #Favorite.create(user_id: current_user.id, post_image_id: @post_image.id)
  end

  def destroy
     post_image = PostImage.find(params[:post_image_id])
     favorite = current_user.favorites.find_by(post_image_id: post_image.id)
     favorite.destroy
     #redirect_to post_image_path(post_image)
    #favorite = Favorite.find_by(user_id: current_user.id, post_image_id: @post_image.id)
    #favorite.destroy
  end

  private
  def post_image_params
    @post_image = PostImage.find(params[:post_image_id])
  end
end
