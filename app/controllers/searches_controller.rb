class SearchesController < ApplicationController
 def search
    @range = params[:range]

    if @range == "PostImage"
      #@users = User.looks(params[:search], params[:word])
      @post_images = PostImage.looks(params[:search], params[:word])
    else
      #@post_images = PostImage.looks(params[:search], params[:word])
      @users = User.looks(params[:search], params[:word])
    end
 end

end
