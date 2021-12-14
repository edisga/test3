class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :edit, :update, :delete, :create]
  before_action :find_course, only: [:show, :edit, :update, :delete]

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
    # if @course.save
    #   flash[:success] = "Curso creado correctamente"
    #   redirect_to course_moduls_path(@course)
    # else
    #   flash[:error] = "Se ha producido un error"
    #   render 'new'
    # end
  end
  
  def edit
  end
  
  def update
    if @course.update(course_params)
      flash[:success] = "Se ha actualizado correctamente"
      redirect_to course_moduls_path(@course)
    else
      flash[:error] = "Se ha producido un error"
      render 'index'
    end
  end
  
  def show
    @course = Course.find(params[:id])
  end
  
  def destroy
    if course.destroy
      redirect_to courses_path, notice: "El curso se ha eliminado correctamente"
    else
      redirect_to buckets_path, notice: "Parece que tenemos problemas para eliminar el curso, inténtalo otra vez."
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
