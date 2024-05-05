class WorkoutLog < ApplicationRecord
  belongs_to :user
  before_validation :set_default_day, on: :create
  
  VALID_STATUSES = ['private']

  validates :status, inclusion: { in: VALID_STATUSES }
end
