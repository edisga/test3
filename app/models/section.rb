class Section < ApplicationRecord
  belongs_to :lesson
  has_many :elements, dependent: :destroy


  validates :title, :description, presence: true
end
