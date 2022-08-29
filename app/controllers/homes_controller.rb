class HomesController < ApplicationController

def top
  @post_image = PostImage.page(params[:page])
  @post_images = PostImage.all
  @post_images = PostImage.all.order(created_at: :desc)
  @user = current_user
  @post_image_favorite_ranks = PostImage.find(Favorite.group(:post_image_id).order('count(post_image_id) desc').pluck(:post_image_id))
end

end