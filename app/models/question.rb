class Question < ApplicationRecord
  belongs_to :lesson
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers

  validates :title, :state, :year, presence: true
  validates_associated :answers
end
