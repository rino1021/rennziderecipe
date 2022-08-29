class Admins::PostImagesController < ApplicationController

  def index
   @post_images = PostImage.all
   @post_images = PostImage.all.order(created_at: :desc)
  end

  def show
   @post_image = PostImage.find(params[:id])
   @post_comment = PostComment.new
   @user =@post_image.user
  end

  def destroy
   @post_image = PostImage.find(params[:id])
   @post_image.destroy
    redirect_to post_images_path
  end

  private

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
