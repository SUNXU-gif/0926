class CookingsController < ApplicationController
  def index
    @dish_name = params[:dish_name].to_s
    @genre_id = params[:genre_id].presence
    scope = Cooking.includes(:genre).order(:id)
    scope = scope.where("title LIKE ?", "%#{@dish_name}%") if @dish_name.present?
    scope = scope.where(genre_id: @genre_id) if @genre_id.present?
    @cookings = scope
  end

  def new
    @cooking = Cooking.new
  end

  def create
    @cooking = Cooking.new(cooking_params)
    if @cooking.save
      redirect_to cooking_path(@cooking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @cooking = Cooking.find(params[:id])
  end

  private

  def cooking_params
    params.require(:cooking).permit(:title, :content, :genre_id)
  end
end
