require "test_helper"

class WorkoutLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workout_log = workout_logs(:one)
  end

  test "should get index" do
    get workout_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_workout_log_url
    assert_response :success
  end

  test "should create workout_log" do
    assert_difference("WorkoutLog.count") do
      post workout_logs_url, params: { workout_log: { description: @workout_log.description, regimen: @workout_log.regimen, user_id: @workout_log.user_id } }
    end

    assert_redirected_to workout_log_url(WorkoutLog.last)
  end

  test "should show workout_log" do
    get workout_log_url(@workout_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_workout_log_url(@workout_log)
    assert_response :success
  end

  test "should update workout_log" do
    patch workout_log_url(@workout_log), params: { workout_log: { description: @workout_log.description, regimen: @workout_log.regimen, user_id: @workout_log.user_id } }
    assert_redirected_to workout_log_url(@workout_log)
  end

  test "should destroy workout_log" do
    assert_difference("WorkoutLog.count", -1) do
      delete workout_log_url(@workout_log)
    end

    assert_redirected_to workout_logs_url
  end
end
