class PostsController < ApplicationController
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
