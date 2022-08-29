class SearchesController < ApplicationController
 def search
     @range = params[:range]
  if @range == "PostImage"
     @post_images = PostImage.looks(params[:search], params[:word])
  else
     @users = User.looks(params[:search], params[:word])
  end
 end
end
