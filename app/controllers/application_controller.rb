class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :about]

  before_action :configure_permitted_parameters, if: :devise_controller?  #ユーザ登録、ログイン認証などが使われる前に実行

  def after_sign_in_path_for(resource)
    posts_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])   #ユーザ登録(sign_up)の際にユーザ名(name)のデータ操作を許可
  end
end
