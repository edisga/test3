class TestsController < ApplicationController
  before_action :find_test, only: [:show]

  def new
    @test = Test.new
  end
  
  def create
    @test = Test.new
    if @test.save
      redirect_to test_path(@test)
    end
  end

  def show
    @test.questions(current_user)
  end

  private

  # def test_params 
  #   params.require(:test).permit(params[:user])
  # end

  def find_test
    @test = Test.find(params[:id])
  end
end
