class Course < ApplicationRecord
  belongs_to :teacher
  has_many :moduls, dependent: :destroy

  validates :title, :description, :duration, :price, :abbreviation, presence: true
end
