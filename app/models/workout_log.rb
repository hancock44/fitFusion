class WorkoutLog < ApplicationRecord
  belongs_to :user
  before_validation :set_default_day, on: :create

  private

  def set_default_day
    self.day ||= Date.today
  end
end
