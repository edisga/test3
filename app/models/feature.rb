class Feature < ApplicationRecord
  belongs_to :course

  validates :description, :icon, presence: true
end
