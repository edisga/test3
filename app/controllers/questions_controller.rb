class QuestionsController < ApplicationController
  before_action :find_question, only: [:edit, :update, :destroy]
  before_action :find_course, only: [:new, :create, :update, :destroy]
  before_action :find_modul, only: [:new, :create]
  def index
    # TODO: Include question to optimize load page
    @questions = Question.all
  end
  
  def new
    @question = Question.new
    4.times { @question.answers.build }
  end
  
  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to new_course_modul_question_path(@course, @modul), notice: 'Pregunta añadida correctamente'
    else
      render action: :new, notice: 'Se ha producido un error'
    end
  end
  
  def edit
  end
  
  def update
    if @question.update(question_params)
      redirect_to course_moduls_path(@course), notice: 'Pregunta actualizada correctamente'
    else
      render 'edit', notice: 'Se ha producido un error'
    end
  end

  def destroy
    if @question.destroy
      redirect_to course_moduls_path(@course), notice: 'Pregunta actualizada correctamente'
    else
      render 'edit', notice: 'Se ha producido un error'
    end    
  end

  private

  def find_question
    @question= params.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :state, :year, :lesson_id, answers_attributes: [:id, :answer, :correct_answer])
  end

  def find_course
    @course = Course.find(params[:course_id])
  end

  def find_modul
    @modul = Modul.find(params[:modul_id])
  end
end
