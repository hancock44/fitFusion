class NutritionLogsController < ApplicationController
  before_action :set_nutrition_log, only: %i[ show edit update destroy ]

  # GET /nutrition_logs or /nutrition_logs.json
  def index
    @nutrition_logs = current_user.nutrition_logs
  end

  # GET /nutrition_logs/1 or /nutrition_logs/1.json
  def show
  end

  # GET /nutrition_logs/new
  def new
    @nutrition_log = NutritionLog.new
  end

  # GET /nutrition_logs/1/edit
  def edit
  end

  # POST /nutrition_logs or /nutrition_logs.json
  def create
    @nutrition_log = NutritionLog.new(nutrition_log_params)

    respond_to do |format|
      if @nutrition_log.save
        format.html { redirect_to nutrition_log_url(@nutrition_log), notice: "Nutrition log was successfully created." }
        format.json { render :show, status: :created, location: @nutrition_log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nutrition_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nutrition_logs/1 or /nutrition_logs/1.json
  def update
    respond_to do |format|
      if @nutrition_log.update(nutrition_log_params)
        format.html { redirect_to nutrition_log_url(@nutrition_log), notice: "Nutrition log was successfully updated." }
        format.json { render :show, status: :ok, location: @nutrition_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nutrition_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nutrition_logs/1 or /nutrition_logs/1.json
  def destroy
    @nutrition_log.destroy!

    respond_to do |format|
      format.html { redirect_to nutrition_logs_url, notice: "Nutrition log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def add_calories
    modify_nutrition_log(:calories_current, 100)
  end

  def remove_calories
    modify_nutrition_log(:calories_current, -100)
  end

  def add_protein
    modify_nutrition_log(:protein_current, 5)
  end

  def remove_protein
    modify_nutrition_log(:protein_current, -5)
  end

  def add_sleep
    modify_nutrition_log(:sleep_current, 5)
  end

  def remove_sleep
    modify_nutrition_log(:sleep_current, -5)
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nutrition_log
      @nutrition_log = NutritionLog.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def nutrition_log_params
      params.require(:nutrition_log).permit(:user_id, :calories_current, :sleep_current, :protein_current, :calories_max, :sleep_max, :protein_max)
    end

    def modify_nutrition_log(attribute, value)
    @nutrition_log[attribute] += value
    @nutrition_log.save
    redirect_to @nutrition_log
  end
end
