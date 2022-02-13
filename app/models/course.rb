class Course < ApplicationRecord
  belongs_to :teacher
  has_many :moduls, dependent: :destroy
  has_many :requirements, dependent: :destroy
  has_many :atributions, dependent: :destroy
  has_many :features, dependent: :destroy
  has_one_attached :image

  validates :title, :description, :duration, :price, :abbreviation, presence: true
end
