class LessonDone < ApplicationRecord
  belongs_to :lesson
  belongs_to :user
end
