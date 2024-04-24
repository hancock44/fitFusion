class WorkoutlogsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @workoutlogs = Workoutlog.all
  end

  def show
    @workoutlog = Workoutlog.find(params[:id])
  end

  def new
    @workoutlog = Workoutlog.new
  end

  def create
    @workoutlog = Workoutlog.new(day: "...", type: "...", description: "...")

    if @workoutlog.save
      redirect_to @workoutlog
    else
      render :new, status: :unprocessable_entity
    end
  end
end
