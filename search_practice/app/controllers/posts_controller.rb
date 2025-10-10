class PostsController < ApplicationController
  before_action :set_post, only: :show

  def index
    @q = Post.ransack(params[:q])                       # 标题/内容搜索
    @posts = @q.result.includes(:user).order(:id)
  end

  def show; end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "投稿しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def set_post = @post = Post.find(params[:id])
  def post_params = params.require(:post).permit(:title, :content)
end
