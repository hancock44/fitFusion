require "test_helper"

class WorkoutlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get workouts" do
    get workoutlogs_workouts_url
    assert_response :success
  end
end
