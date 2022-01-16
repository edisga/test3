class ElementsController < ApplicationController
  before_action :find_section
  before_action :find_element, only: [:update, :destroy ]

  def create
    @element = @post.elements.build(element_params)

    if @element.save
      notice = nil
    else
      notice = @element.errors.full_messages.join(". ") << "."
    end
    redirect_to edit_post_path(@post), notice: notice
  end

  # PATCH/PUT /elements/1
  def update
    @element.update(element_params)
  end

  # DELETE /elements/1
  def destroy
    @element.destroy
    redirect_to edit_post_path(@element.post)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_element
      @element = @section.find(params[:id])
    end

    def find_section
      @section = Section.find(params[:section_id])

    # Only allow a list of trusted parameters through.
    def element_params
      params.require(:element).permit(:element_type, :section_id, :position)
    end
end
