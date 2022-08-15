class UsersController < ApplicationController
  before_action :current_user, only: [:edit,:update,:favorites]
  def show
    #favorites
     @user = User.find(params[:id])
     favorites= Favorite.where(user_id: @user.id).pluck(:post_image_id)
     @favorite_post_images = PostImage.find(favorites)
     @post_images = @user.post_images

  end

  def index
    @user = User.find(params[:id])
    @post_images = @user.post_images
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    #@user.update(user_params)
    #redirect_to user_path
    if@user.update(user_params)
    redirect_to user_path(@user.id),notice:"You have updated user successfully."
    else
    render:edit
    end
  end

  def favorites
    @user = User.find(params[:id])
    favorites= Favorite.where(user_id: @user.id).pluck(:post_image_id)
    @favorite_post_images = PostImage.find(favorites)
    #@post_imags = @user.post_image
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
