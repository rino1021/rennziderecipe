class RanksController < ApplicationController
  def rank
  # 投稿のいいね数ランキング
  #@post_image_favorite_ranks = PostImage.find(Favorite.group(:post_image_id).order('count(post_image_id) desc').pluck(:post_image_id))
  @post_image_favorite_ranks = PostImage.find(Favorite.group(:post_image_id).order('count(post_image_id) DESC').limit(5).pluck(post_image_id))
  #@post_images = PostImage.order("created_at DESC")

  end

end
