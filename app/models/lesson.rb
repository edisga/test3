class Lesson < ApplicationRecord
  belongs_to :modul
  has_many :sections
end
