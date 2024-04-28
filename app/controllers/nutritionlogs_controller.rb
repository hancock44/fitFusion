class NutritionlogsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @workoutlogs = current_user.nutrition_logs.limit(7)
  end

  def new
      @nutrition_log = NutritionLog.new
  end
  
  def create
    @nutrition_log = NutritionLog.new(nutrition_log_params)
  
    if @nutrition_log.save
        redirect_to @nutrition_log
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @nutrition_log = NutritionLog.find(params[:id])
  end

  def update
    @nutrition_log = NutritionLog.find(params[:id])

    if @nutrition_log.update(nutrition_log_params)
      redirect_to @nutrition_log
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @nutrition_log = NutritionLog.find(params[:id])
    @nutrition_log.destroy

    redirect_to root_path, status: :see_other
  end
  
  def add_calories
    @nutrition_log = NutritionLog.find(params[:id])
    @nutrition_log.calories_consumed += 100
    @nutrition_log.save
    redirect_to @nutrition_log
  end

  def remove_calories
    @nutrition_log = NutritionLog.find(params[:id])
    @nutrition_log.calories_consumed -= 100
    @nutrition_log.save
    redirect_to @nutrition_log
  end

  def add_protein
    @nutrition_log = NutritionLog.find(params[:id])
    @nutrition_log.protein_intake += 5
    @nutrition_log.save
    redirect_to @nutrition_log
  end

  def remove_protein
    @nutrition_log = NutritionLog.find(params[:id])
    @nutrition_log.protein_intake -= 5
    @nutrition_log.save
    redirect_to @nutrition_log
  end

  def add_sleep
    @nutrition_log = NutritionLog.find(params[:id])
    @nutrition_log.current_sleep_hours += 5
    @nutrition_log.save
    redirect_to @nutrition_log
  end

  def remove_sleep
    @nutrition_log = NutritionLog.find(params[:id])
    @nutrition_log.current_sleep_hours -= 5
    @nutrition_log.save
    redirect_to @nutrition_log
  end

  private
    def nutrition_log_params
      params.require(:nutrition_log).permit(:date, :protein_intake, :current_sleep_hours, :calories_consumed,
        :max_calories, :min_protein, :min_sleep)
    end
end
