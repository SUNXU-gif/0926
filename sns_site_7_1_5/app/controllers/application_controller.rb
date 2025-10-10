class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource) = mypage_path(current_user)
  def after_sign_up_path_for(_resource) = mypage_path(current_user)
  def after_sign_out_path_for(_resource_or_scope) = root_path

  protected
  def configure_permitted_parameters
    keys = [:name, :content]
    devise_parameter_sanitizer.permit(:sign_up,        keys: keys)
    devise_parameter_sanitizer.permit(:account_update, keys: keys)
  end
end
