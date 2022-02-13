class RequirementsController < ApplicationController
  before_action :find_course
  before_action :find_requirement, only: [:update, :delete]

  def new
    @requirement = Requirement.new
  end

  def create
    @requirement = Requirement.new(requirement_params)
    @requirement.course = @course
    if @requirement.save
      redirect_to edit_course_path(@course), notice: "Atributo añadido correctamente"
    else
      redirect_to edit_course_path(@course), notice: "Se ha producido un error"
    end
  end

  def update
    if @requirement.update(requirement_params)
      redirect_to edit_course_path(@course), notice: "Atributo añadido correctamente"
    else
      redirect_to edit_course_path(@course), notice: "Se ha producido un error"
    end
  end

  def destroy
    if @requirement.destroy
      redirect_to edit_course_path(@course), notice: "Atributo elimninado correctamente"
    else
      redirect_to edit_course_path(@course), notice: "No ha podido eliminarse"
    end
  end

  private

  def find_course
    @course = Course.find(params[:course_id])
  end

  def find_requirement
    @requirement = requirement.find(params[:id])
  end

  def requirement_params
    params.require(:requirement).permit(:title, :description)
  end
end
