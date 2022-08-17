class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

 #投稿データの保存
 def create
   @post_image = PostImage.new(post_image_params)
   @post_image.user_id = current_user.id
   if@post_image.save
    redirect_to post_images_path
   else
   render :new
   end
 end

 def index
   @post_images = PostImage.all
   @post_image = PostImage.page(params[:page])
   @user = current_user

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



 #投稿データののストロングパラメータ
 private

 def post_image_params
   params.require(:post_image).permit(:recipe_name,:image,:caption,)
 end


end
