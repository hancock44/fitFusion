class WorkoutlogsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @workoutlogs = Workoutlog.all
  end

  def show
    @workoutlog = Workoutlog.find(params[:id])
  end
end
