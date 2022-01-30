class ElementsController < ApplicationController
  before_action :find_section
  before_action :find_lesson
  before_action :find_modul
  before_action :find_course
  before_action :find_element, only: [:update, :destroy ]

  def create
    @element = @section.elements.build(element_params)

    if @element.save
      notice = nil
    else
      notice = @element.errors.full_messages.join(". ") << "."
    end
    redirect_to edit_course_modul_lesson_section_path(@course, @modul, @lesson, @section), notice: notice
  end

  # PATCH/PUT /elements/1
  def update
    if @element.update(element_params)
      redirect_to edit_course_modul_lesson_section_path(@course, @modul, @lesson, @section), notice: 'Saved'
    else
      render :edit, notice: 'Error'
    end
  end

  # DELETE /elements/1
  def destroy
    @element.destroy
    redirect_to edit_course_modul_lesson_section_path(@course, @modul, @lesson, @section)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_element
      @element = @section.elements.find(params[:id])
    end

    def find_section
      @section = Section.find(params[:section_id])
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

    # Only allow a list of trusted parameters through.
    def element_params
      params.require(:element).permit(:element_type, :content, :image)
    end
end
