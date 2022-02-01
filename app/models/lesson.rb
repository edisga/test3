class Lesson < ApplicationRecord
  belongs_to :modul
  has_many :sections, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :title, presence: true
end
