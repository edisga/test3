class Test < ApplicationRecord
  has_many :question
  has_one :teacher


  def questions
    @questions = Question.select.first(10)
  end
  
end
