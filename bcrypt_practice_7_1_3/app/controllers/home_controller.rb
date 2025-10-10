class HomeController < ApplicationController
  def top
    redirect_to mypage_path if session[:user_id] # 已登录跳转 mypage
  end
end
