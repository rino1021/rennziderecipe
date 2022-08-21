class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: :destroy

  def ensure_normal_user
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは削除できません。'
    end
  end
  def after_sign_up_path_for(resource)
    root_path(resource)
  end

  def destroy
    # 論理削除処理
    soft_delete(current_user)
    # Deviceの論理削除後の後処理
    respond_with_navigational do
      # 強制ログアウト
      sign_out current_user
      # ログアウト後のページ遷移
      redirect_to root_path
    end
  end

    def soft_delete(user)
    # 同じメールアドレスでも登録できるように、
    # メールアドレスを“hoge@example.com_deleted_**********”に変更する
    deleted_email = user.email + '_deleted_' + Time.current.to_i.to_s
    user.assign_attributes(email: deleted_email, deleted_at: Time.current)
    # 保存処理
    user.save
    end



end
