class LessonsController < ApplicationController
  before_action :find_lesson, only: [:show, :edit, :update, :destroy]
  before_action :find_modul, only: [:show, :edit, :update, :create, :destroy]
  before_action :find_course, only: [:show, :edit, :update, :create, :destroy]
  
  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.modul = @modul
    if @lesson.save
      redirect_to course_modul_lesson_path(@course, @modul, @lesson), notice: 'Lección creada correctamente'
    else
      redirect_to course_moduls_path(@course), notice: 'Se ha producido un error'
    end
  end

  def show
    @sections = @lesson.sections
  end
  
  def update
    if @lesson.update(lesson_params)
      redirect_to course_modul_lesson_sections_path(@course, @modul, @lesson), notice: 'Lección actualizada'
    else
      render 'show', notice: 'Se ha producido un error'
    end
  end
  
  def destroy
    if @lesson.destroy
      redirect_to course_moduls_path(@course), notice: 'Lección eliminada correctamente'
    else
      redicert_to course_moduls_path(@course), notice: 'Se ha producido un error'
    end
  end

  private

  def find_lesson
    @lesson = Lesson.find(params[:id])
  end

  def find_modul
    @modul = Modul.find(params[:modul_id])
  end

  def find_course
    @course = Course.find(params[:course_id])
  end

  def lesson_params
    params.require(:lesson).permit(:title)
  end
end
