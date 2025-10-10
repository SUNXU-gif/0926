class HomeController < ApplicationController
  def top
    redirect_to mypage_path(current_user) if user_signed_in?
  end
end
