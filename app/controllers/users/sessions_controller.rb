class Users::SessionsController  < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  def after_sign_in_path_for(resource)
    root_path(resource)
  end
end
