class MypagesController < ApplicationController
  def index
    @q = User.ransack(params[:q])     # 按 name 搜索
    @users = @q.result.order(:id)
  end

  def show
    @user = User.find(params[:id])
  end
end
