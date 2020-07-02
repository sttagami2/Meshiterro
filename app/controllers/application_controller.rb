class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # ログイン承認が成功していないと、どの画面も表示できない設定

  before_action :configure_permitted_parameters, if: :devise_controller?
  # devise利用機能（ユーザ登録、ログイン認証など）が使われる場合、その前にcongifure_permitted_parametersが実行される

  protected    # privateは、自分のコントローラ内でしか参照できません。一方、protectedは呼び出された他のコントローラからも参照できます。

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
