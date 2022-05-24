class ExperiencesController < ApplicationController
  def index
    @experiences = Experience.all
  end

  def show
    @experience = Experience.find(params[:id])
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(review_params)
    @experience.user = current_user
    if @experience.save
      redirect_to user_experiences_path(current_user), notice: 'Experience was successfully created.'
    else
      render :new
    end
  end

  def edit

  end

  private

  def review_params
    params.require(:experience).permit(:name, :description, :price)
  end
end
