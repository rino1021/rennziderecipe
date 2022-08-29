class Admins::UsersController < ApplicationController
  def index
    @post_image = PostImage.new
    @user = current_user
    @users = User.all
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    favorites= Favorite.where(user_id: @user.id).pluck(:post_image_id)
    @favorite_post_images = PostImage.find(favorites)
    @post_images = @user.post_images
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if@user.update(user_params)
     redirect_to user_path(@user.id),notice:"You have updated user successfully."
    else
     render:edit
    end
  end

  def destroy
     @user = User.find(params[:id])
     if @user.destroy
      redirect_to admins_users_path# データ（レコード）を削除
    else
    end
  end

  def favorites
     @user = User.find(params[:id])
     favorites= Favorite.where(user_id: @user.id).pluck(:post_image_id)
     @favorite_post_images = PostImage.find(favorites)
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end

