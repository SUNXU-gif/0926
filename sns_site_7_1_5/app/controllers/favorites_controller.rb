class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    current_user.favorites.find_or_create_by!(post:)
    redirect_to post, notice: "お気に入りしました。"
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.favorites.where(post:).destroy_all
    redirect_to post, notice: "お気に入りを外しました。"
  end
end
