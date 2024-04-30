require "application_system_test_case"

class WorkoutLogsTest < ApplicationSystemTestCase
  setup do
    @workout_log = workout_logs(:one)
  end

  test "visiting the index" do
    visit workout_logs_url
    assert_selector "h1", text: "Workout logs"
  end

  test "should create workout log" do
    visit workout_logs_url
    click_on "New workout log"

    fill_in "Description", with: @workout_log.description
    fill_in "Regimen", with: @workout_log.regimen
    fill_in "User", with: @workout_log.user_id
    click_on "Create Workout log"

    assert_text "Workout log was successfully created"
    click_on "Back"
  end

  test "should update Workout log" do
    visit workout_log_url(@workout_log)
    click_on "Edit this workout log", match: :first

    fill_in "Description", with: @workout_log.description
    fill_in "Regimen", with: @workout_log.regimen
    fill_in "User", with: @workout_log.user_id
    click_on "Update Workout log"

    assert_text "Workout log was successfully updated"
    click_on "Back"
  end

  test "should destroy Workout log" do
    visit workout_log_url(@workout_log)
    click_on "Destroy this workout log", match: :first

    assert_text "Workout log was successfully destroyed"
  end
end
