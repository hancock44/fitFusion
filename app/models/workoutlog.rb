class Workoutlog < ApplicationRecord
  belongs_to :user

  validates :day, presence: true
  validates :regimen, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
