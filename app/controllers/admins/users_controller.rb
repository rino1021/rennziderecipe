class Admins::UsersController < ApplicationController
  def index
    @post_image = PostImage.new
    @user = current_user
    @users = User.all
    #@user = User.find(params[:id])
    #@post_images = current_user.post_images
  end
end
