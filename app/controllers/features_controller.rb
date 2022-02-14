class FeaturesController < ApplicationController
  before_action :find_course
  before_action :find_feature, only: [:edit, :update, :destroy]

  def new
    @feature = Feature.new
  end

  def create
    @feature = Feature.new(feature_params)
    @feature.course = @course
    if @feature.save
      redirect_to edit_course_path(@course), notice: "Característica añadida correctamente"
    else
      redirect_to edit_course_path(@course), notice: "Se ha producido un error"
    end
  end

  def edit
  end

  def update
    if @feature.update(feature_params)
      redirect_to edit_course_path(@course), notice: "Característica actualizada correctamente"
    else
      redirect_to edit_course_path(@course), notice: "Se ha producido un error"
    end
  end

  def destroy
    if @feature.destroy
      redirect_to edit_course_path(@course), notice: "Característica eliminada correctamente"
    else
      redirect_to edit_course_path(@course), notice: "Se ha producido un error"
    end
  end

  private 

  def find_course
    @course = Course.find(params[:course_id])
  end

  def find_feature
    @feature = Feature.find(params[:id])
  end

  def feature_params
    params.require(:feature).permit(:description, :icon)
  end
end
