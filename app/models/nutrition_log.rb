class NutritionLog < ApplicationRecord
  belongs_to :user

  validates :max_calories, presence: true
  validates :min_protein, presence: true
  validates :min_sleep, presence: true
end
