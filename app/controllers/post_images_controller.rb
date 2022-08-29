class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
    @post_image.ingredients.build ##親モデル.子モデル.buildで子モデルのインスタンス作成
    @captions = @post_image.captions.build
  end

 #投稿データの保存
 def create
   @post_image = PostImage.new(post_image_params)
   @post_image.user_id = current_user.id
   if @post_image.save
      redirect_to post_images_path
   else
      render :new
   end
 end

 def index
   @post_images = PostImage.all
   @post_images = PostImage.all.order(created_at: :desc)
   #@post_image = PostImage.page(params[:page])
   @user = current_user

 end

 def show
   @post_image = PostImage.find(params[:id])
   @post_comment = PostComment.new
   @user =@post_image.user
 end

  def edit
      @post_image = PostImage.find(params[:id])
    if@post_image.user.id == current_user.id
       render "edit"
    else
       redirect_to post_images_path

    end
  end

   def update
    @post_image =PostImage.find(params[:id])
    @post_image.update(post_image_params)

    if @post_image.update(post_image_params)
     redirect_to post_image_path(@post_image), notice:"Recipe was successfully updated."
    else
      render :edit
    end
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
   params.require(:post_image).permit(:recipe_name,:image,ingredients_attributes: [:name,:_destroy],captions_attributes:[:caption, :_destroy])
 end


end
