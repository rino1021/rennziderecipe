class HomesController < ApplicationController

def top
  @post_image = PostImage.page(params[:page])
  @post_images = PostImage.all
end

end