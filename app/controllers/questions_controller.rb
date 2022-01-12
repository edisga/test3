class QuestionsController < ApplicationController
  before_action :find_question, only: [:edit, :update, :destroy]
  before_action :find_course, only: [:new, :create, :update, :destroy]
  before_action :find_modul, only: [:new, :create]
  def index
    @questions = Question.all
  end
  
  def new
    @question = Question.new
    @question.answers.new
    @question.answers.new
    @question.answers.new
    @question.answers.new
  end
  
  def create
    raise
    @question = Question.new(question_params)
    if @question.save
      @question.answers.save
      redirect_to course_modul_questions(@course, @modul), notice: 'Pregunta añadida correctamente'
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
    params.require(:question).permit(:title, :state, :year, answers_attributes: [:answer, :correct_answer])
  end

  def find_course
    @course = Course.find(params[:course_id])
  end

  def find_modul
    @modul = Modul.find(params[:modul_id])
  end
end
