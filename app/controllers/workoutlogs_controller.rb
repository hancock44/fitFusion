class WorkoutlogsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @workoutlogs = current_user.workoutlogs.ordwer("RANDOM()").first(1)
  end

  def show
    @workoutlog = Workoutlog.find(params[:id])
  end

  def new
    @workoutlog = Workoutlog.new
  end

  def create
    @workoutlog = Workoutlog.new(workoutlog_params)

    if @workoutlog.save
      redirect_to @workoutlog
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @workoutlog = Workoutlog.find(params[:id])
  end

  def update
    @workoutlog = Workoutlog.find(params[:id])

    if @workoutlog.update(workoutlog_params)
      redirect_to @workoutlog
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @workoutlog = Workoutlog.find(params[:id])
    @workoutlog.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def workoutlog_params
      params.require(:workoutlog).permit(:day, :regimen, :description)
    end
end
