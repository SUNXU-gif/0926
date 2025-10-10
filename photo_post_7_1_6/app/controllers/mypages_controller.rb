class MypagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show; end
  def edit; end

  def update
    if @user.update(user_params)
      redirect_to mypage_path(@user), notice: "マイページを更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def set_user      = @user = current_user
  def user_params   = params.require(:user).permit(:name, :icon) # 只能改名和头像
end
