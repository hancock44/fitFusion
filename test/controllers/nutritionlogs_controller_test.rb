require "test_helper"

class NutritionlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get nutrition" do
    get nutritionlogs_nutrition_url
    assert_response :success
  end
end
