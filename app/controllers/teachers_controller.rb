class TeachersController < ApplicationController
  # skip_before_action :authenticate_user!

  before_action :find_teacher, only: [:my_courses, :show, :edit, :update, :destroy]

  def my_courses
    @courses = @teacher.courses
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_teacher
    @teacher = current_teacher
  end
end
