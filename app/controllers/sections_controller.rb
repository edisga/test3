class SectionsController < ApplicationController
  before_action :find_section, only: [:show, :edit, :update, :destroy]
  before_action :find_lesson
  before_action :find_modul
  before_action :find_course

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    @section.lesson = @lesson
    if @section.save
      redirect_to course_modul_lesson_section_path(@course, @modul, @lesson, @section), notice: 'Clase creada correctamente'
    else
      redirect_to course_modul_lesson_path(@course, @modul, @lesson), notice: 'Se ha producido un error'
    end
  end

  def edit
  end

  def update
    if @section.update(section_params)
      redirect_to course_modul_lesson_section_path(@course, @modul, @lesson, @section), notice: 'Clase actualizada correctamente'
    else
      render 'edit', notice: 'Se ha producido un error'
    end
  end

  def show
  end

  def destroy
    if @section.destroy
      redirect_to course_modul_lesson_path(@course, @modul, @lesson), notice: 'La clase se ha eliminado correctamente'
    else
      redirect_to course_modul_lesson_path(@course, @modul, @lesson), notice: 'Se ha producido un error'
    end
  end



  private

  def find_section
    @section = Section.find(params[:id])
  end

  def find_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def find_modul
    @modul = Modul.find(params[:modul_id])
  end

  def find_course
    @course = Course.find(params[:course_id])
  end

  def section_params
    params.require(:section).permit(:title, :description, :text)
  end
end
