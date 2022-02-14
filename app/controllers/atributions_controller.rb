class AtributionsController < ApplicationController
  before_action :find_course
  before_action :find_atribution, only: [:edit, :update, :destroy]

  def new
    @atribution = Atribution.new
  end

  def create
    @atribution = Atribution.new(atribution_params)
    @atribution.course = @course
    if @atribution.save
      redirect_to edit_course_path(@course), notice: "Atributo añadido correctamente"
    else
      redirect_to edit_course_path(@course), notice: "Se ha producido un error"
    end
  end

  def edit
  end

  def update
    if @atribution.update(atribution_params)
      redirect_to edit_course_path(@course), notice: "Atributo añadido correctamente"
    else
      redirect_to edit_course_path(@course), notice: "Se ha producido un error"
    end
  end

  def destroy
    if @atribution.destroy
      redirect_to edit_course_path(@course), notice: "Atributo elimninado correctamente"
    else
      redirect_to edit_course_path(@course), notice: "No ha podido eliminarse"
    end
  end

  private

  def find_course
    @course = Course.find(params[:course_id])
  end

  def find_atribution
    @atribution = Atribution.find(params[:id])
  end

  def atribution_params
    params.require(:atribution).permit(:title, :description, :image)
  end
end
