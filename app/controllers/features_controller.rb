class FeaturesController < ApplicationController
  before_action :find_course
  before_action :find_feature, only: [:update, :delete]

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

  private 

  def find_course
    @course = Course.find(params[:course_id])
  end

  def find_feature
    @feature = Feature.find(params[:id])
  end

  def feature_params
    params.require(:feature).permit(:description)
  end
end
