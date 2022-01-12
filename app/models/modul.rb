class Modul < ApplicationRecord
  belongs_to :course
  has_many :lessons, dependent: :destroy

  has_one_attached :upload_document

  validates :title, :download_document, presence: true
end
