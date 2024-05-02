require "test_helper"

class NutritionLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nutrition_log = nutrition_logs(:one)
  end

  test "should get index" do
    get nutrition_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_nutrition_log_url
    assert_response :success
  end

  test "should create nutrition_log" do
    assert_difference("NutritionLog.count") do
      post nutrition_logs_url, params: { nutrition_log: { calories_current: @nutrition_log.calories_current, calories_max: @nutrition_log.calories_max, protein_current: @nutrition_log.protein_current, protein_max: @nutrition_log.protein_max, sleep_current: @nutrition_log.sleep_current, sleep_max: @nutrition_log.sleep_max, user_id: @nutrition_log.user_id } }
    end

    assert_redirected_to nutrition_log_url(NutritionLog.last)
  end

  test "should show nutrition_log" do
    get nutrition_log_url(@nutrition_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_nutrition_log_url(@nutrition_log)
    assert_response :success
  end

  test "should update nutrition_log" do
    patch nutrition_log_url(@nutrition_log), params: { nutrition_log: { calories_current: @nutrition_log.calories_current, calories_max: @nutrition_log.calories_max, protein_current: @nutrition_log.protein_current, protein_max: @nutrition_log.protein_max, sleep_current: @nutrition_log.sleep_current, sleep_max: @nutrition_log.sleep_max, user_id: @nutrition_log.user_id } }
    assert_redirected_to nutrition_log_url(@nutrition_log)
  end

  test "should destroy nutrition_log" do
    assert_difference("NutritionLog.count", -1) do
      delete nutrition_log_url(@nutrition_log)
    end

    assert_redirected_to nutrition_logs_url
  end
end
