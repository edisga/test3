class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show  ]

  def index
    @courses = Course.all
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
    @course = Course.find(params[:id])
  end
  
  def destroy
  
  end
end
