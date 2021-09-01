class Course < ApplicationRecord
  belongs_to :teacher
  has_many :moduls
  has_many :atributions
  has_many :requirements
end
