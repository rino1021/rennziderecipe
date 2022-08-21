class Users::SessionsController  < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  def after_sign_in_path_for(resource)
    root_path(resource)
  end
  def create
    user = User.find_by(email: params[:user][:email])
    if user.nil?
      # メールアドレスに該当がない場合は、新規登録画面に遷移
      #   ユーザー登録されていない旨のフラッシュメッセージを仕込むならこのセクション
      redirect_to new_user_registration_path
    else
      # パスワードの確認と、deleted_atにデータたが入っていないか
      #   deleted_atに日付が入っていれば再度ログイン画面へ遷移させる。
      if user.valid_password?(params[:user][:password]) && user.deleted_at.nil?
        # ログイン成功
        #   ログイン成功のフラッシュメッセージを仕込むならこのセクション
        # ---
        # ログイン情報をユーザー側に記録
        sign_in user
        # ログイン成功時の遷移
        redirect_to root_path
      else
        # ログイン失敗時の遷移
        # ---
        #   ログイン失敗のフラッシュメッセージを仕込むならこのセクション
        redirect_to new_user_session_path
      end
    end
  end
end
