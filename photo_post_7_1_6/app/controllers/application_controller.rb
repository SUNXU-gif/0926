class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 登录/注册后进我的页面；登出回到首页
  def after_sign_in_path_for(_resource)  = mypage_path(current_user)
  def after_sign_up_path_for(_resource)  = mypage_path(current_user)
  def after_sign_out_path_for(_resource) = root_path

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,        keys: [:name, :icon])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :icon])
  end
end
