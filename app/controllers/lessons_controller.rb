class LessonsController < ApplicationController
  before_action :find_lesson, only: [:show, :edit, :update, :delete]
  before_action :find_module, only: [:show, :edit, :update, :index, :new, :create]
  def index
    @lessons = @moduls.lessons
  end
  
  def new
  
  end
  
  def create
  
  end
  
  def edit
  
  end
  
  def update
  
  end
  
  def show
  
  end
  
  def destroy
  
  end

  private

  def find_lesson
    @lesson = Lesson.find(params[:id])
  end

  def find_module
    @modul = Modul.find(params[:modul_id])
  end
end
