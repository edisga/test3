class Atribution < ApplicationRecord
  belongs_to :course

  has_one_attached :image, dependent: :destroy
  
  validates :title, :description, presence: true
end
