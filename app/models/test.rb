class Test < ApplicationRecord
  has_many :question
  has_one :teacher
    

  def questions
    @user = current_user
    @lessons_done = LessonDone.where(user: current_user)
    @questions = @lessons_done.select.first(2).questions
  end
  
end
