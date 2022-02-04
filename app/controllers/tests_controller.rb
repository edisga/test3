class TestsController < ApplicationController
  before_action :find_test, only: [:show]

  def new
    @test = Test.new
  end
  
  def create
    @test = Test.new
    @test.teacher = current_teacher
    if @test.save
      redirect_to test_path(@test)
    end
  end

  def show
    @questions = @test.questions
  end

  private

  # def test_params 
  #   params.require(:test).permit(params[:id])
  # end

  def find_test
    @test = params.find(params[:id])
  end
end
