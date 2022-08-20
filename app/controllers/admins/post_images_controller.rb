class Admins::PostImagesController < ApplicationController
  def index
   @post_images = PostImage.all
   @post_image = PostImage.page(params[:page])
   #@user = current_user
  end

  def show
   @post_image = PostImage.find(params[:id])
   @post_comment = PostComment.new
   @user =@post_image.user
  end

  def destroy
  #PostImage.find(params[:id]).destroy
  #redirect_to post_images_path
  @post_image = PostImage.find(params[:id])  # データ（レコード）を1件取得
  @post_image.destroy  # データ（レコード）を削除
  redirect_to post_images_path  # 投稿一覧画面へリダイレクト
  end

  　private
  　　def if_not_admin
    　　redirect_to root_path unless current_user.admin?
  　　end


end
