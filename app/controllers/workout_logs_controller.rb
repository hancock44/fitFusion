class WorkoutLogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workout_log, only: %i[ show edit update destroy ]

  # GET /workout_logs or /workout_logs.json
  def index
    @workout_logs = current_user.workout_logs.where(user_id: current_user.id)
  end

  # GET /workout_logs/1 or /workout_logs/1.json
  def show
    @workout_log = WorkoutLog.find(params[:id])
  end

  # GET /workout_logs/new
  def new
  @workout_log = current_user.workout_logs.build
  end

  # GET /workout_logs/1/edit
  def edit
  end

  # POST /workout_logs or /workout_logs.json
  def create
    @workout_log = WorkoutLog.new(workout_log_params)
    respond_to do |format|
      if @workout_log.save
        current_user = User.find_by(id: user_id)
        current_user.add_workout_count(1)
        format.html { redirect_to workout_log_url(@workout_log), notice: "Workout log was successfully created." }
        format.json { render :show, status: :created, location: @workout_log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @workout_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workout_logs/1 or /workout_logs/1.json
  def update
    respond_to do |format|
      if @workout_log.update(workout_log_params)
        format.html { redirect_to workout_log_url(@workout_log), notice: "Workout log was successfully updated." }
        format.json { render :show, status: :ok, location: @workout_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @workout_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workout_logs/1 or /workout_logs/1.json
  def destroy
    @workout_log.destroy!

    respond_to do |format|
      format.html { redirect_to workout_logs_url, notice: "Workout log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def add_workout_count(workout_log_count)
      previous_count = self.workout_log_count
      total_count = previous_count + workout_log_count
      self.update_attribute(:workout_log_count, total_count)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_workout_log
      @workout_log = WorkoutLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def workout_log_params
      params.require(:workout_log).permit(:user_id, :regimen, :description, :status, :workout_logs_count)
    end
end
