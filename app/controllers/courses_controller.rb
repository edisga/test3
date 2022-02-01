class CoursesController < ApplicationController
  # skip_before_action :authenticate_user!
  # skip_before_action :authenticate_teacher!, only: [:index, :show]
  before_action :find_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end
  
  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.teacher = current_teacher
    if @course.save
      redirect_to course_moduls_path(@course), notice: 'Curso creado correctamente'
    else
      render 'new', notice: 'Se ha producido un error'
    end
  end
  
  def edit
  end
  
  def update
    if @course.update(course_params)
      redirect_to course_moduls_path(@course), notice: 'Curso actualizado correctamente'
    else
      flash[:error] = "Se ha producido un error"
      render 'index'
    end
  end
  
  def show
    @course = Course.find(params[:id])
  end
  
  def destroy
    if @course.destroy
      redirect_to my_courses_teacher_path, notice: "El curso se ha eliminado correctamente"
    else
      redirect_to my_courses_teacher_path, notice: "Se ha producido un error"
    end
  end

  private

  def find_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :duration, :price, :abbreviation)
  end
end
