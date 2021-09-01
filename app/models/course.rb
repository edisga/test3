class Course < ApplicationRecord
  belongs_to :teacher
  has_many :moduls
end
