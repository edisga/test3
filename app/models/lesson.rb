class Lesson < ApplicationRecord
  belongs_to :modul
  has_many :sections
  has_many :questions, dependent: :destroy
end
