class Section < ApplicationRecord
  belongs_to :lesson
  has_many :elements


  validates :title, :description, :text, presence: true
end
