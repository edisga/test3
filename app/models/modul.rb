class Modul < ApplicationRecord
  belongs_to :course
  has_many :lessons, dependent: :destroy

  validates :title, :download_document, presence: true
end
