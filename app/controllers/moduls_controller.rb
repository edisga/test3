class ModulsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :new, :edit, :update, :delete, :create]
  before_action :find_modul, only: [:show, :edit, :update, :destroy]
  before_action :find_course, only: [:show, :edit, :update, :index, :new, :create]

  def index
    # TODO: ORDER MODULS BY ORDER
    @moduls = @course.moduls
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

  def find_modul
    @modul = Modul.find(params[:id])
  end

  def find_course
    @course = Course.find(params[:course_id])
  end
end
