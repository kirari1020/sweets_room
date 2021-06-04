class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?  #ユーザ登録、ログイン認証などが使われる前に実行

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])   #ユーザ登録(sign_up)の際にユーザ名(name)のデータ操作を許可
  end
end
