class UsersController < ApplicationController
  before_action :authenticate_user!  # Devise 提供的，未登录会自动跳转到登录页面

  def show
    @user = current_user
  end
end
