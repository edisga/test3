class Lesson < ApplicationRecord
  belongs_to :modul
  has_many :sections, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :lessons_done

  validates :title, presence: true
end
