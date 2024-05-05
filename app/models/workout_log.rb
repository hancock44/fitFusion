class WorkoutLog < ApplicationRecord
  belongs_to :user
  
  VALID_STATUSES = ['private']

  validates :status, inclusion: { in: VALID_STATUSES }
end
