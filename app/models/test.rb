class Test < ApplicationRecord
  has_many :question
  has_one :teacher
  has_one :user  

  def questions(user)
    
  end

end
