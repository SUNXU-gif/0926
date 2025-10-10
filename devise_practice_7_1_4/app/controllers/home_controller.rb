class HomeController < ApplicationController
  def top
    redirect_to mypage_path if user_signed_in?
  end
end
