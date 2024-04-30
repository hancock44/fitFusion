class Workoutlog < ApplicationRecord
  belongs_to :user

  validates :day, length: { maximum: 255 }
  validates :regimen, length: { maximum: 255 }
  validates :description, length: { maximum: 1000 }
end
