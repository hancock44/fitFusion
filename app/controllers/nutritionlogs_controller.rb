class NutritionlogsController < ApplicationController
  before_action :authenticate_user!
  def nutrition
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
end
