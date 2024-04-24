class WorkoutlogsController < ApplicationController
  before_action :authenticate_user!
  def workouts
    @workoutlogs = Workoutlog.all
  end
end
