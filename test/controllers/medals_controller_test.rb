require "test_helper"

class MedalsControllerTest < ActionDispatch::IntegrationTest
  test "should get medals" do
    get medals_medals_url
    assert_response :success
  end
end
