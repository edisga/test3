class ModulsController < ApplicationController
  # skip_before_action :authenticate_user! if teacher_signed_in?
  # skip_before_action :authenticate_user! if user_signed_in?

  before_action :find_modul, only: [:show, :edit, :update, :destroy]
  before_action :find_course, only: [:index, :edit, :new, :create, :update, :destroy]

  def index
    # TODO: ORDER MODULS BY ORDER
    @lesson = Lesson.new
    @modul = Modul.new
    @moduls = @course.moduls.order(order: :asc)
  end

  def new
    @modul = Modul.new
  end

  def create
    @modul = Modul.new(modul_params)
    @modul.course = @course
    if @modul.save
      redirect_to course_moduls_path(@course), notice: 'Módulo creado correctamente'
    else
      render 'new', notice: 'Se ha producido un error'
    end
  end

  def edit
  end
  
  def update
    if @modul.update(modul_params)
      redirect_to course_moduls_path(@course), notice: 'Módulo actualizado correctamente'
    else
      render 'edit', notice: 'Se ha producido un error'
    end
  end
  
  def destroy
    if @modul.destroy
      redirect_to course_moduls_path(@course), notice: "Módulo eliminado correctamente"
    else
      redirect_to course_moduls_path(@course), notice: "Se ha producido un error"
    end
  end

  private

  def find_modul
    @modul = Modul.find(params[:id])
  end

  def find_course
    @course = Course.find(params[:course_id])
  end

  def modul_params
    params.require(:modul).permit(:title, :download_document, :order)
  end
end
