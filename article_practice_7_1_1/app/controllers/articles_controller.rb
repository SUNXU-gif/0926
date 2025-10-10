class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    puts params.inspect  # 调试用：看看传入的参数
    if @article.save
      flash[:notice] = "新規投稿しました。"
      redirect_to articles_path
    else
      puts @article.errors.full_messages  # 调试失败原因
      render :new
    end
  end


  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "投稿を更新しました。"
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:alert] = "投稿を削除しました。"
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
 
end
