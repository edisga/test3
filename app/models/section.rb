class Section < ApplicationRecord
  belongs_to :lesson

  validates :title, :description, :text, presence: true
end
