require "application_system_test_case"

class NutritionLogsTest < ApplicationSystemTestCase
  setup do
    @nutrition_log = nutrition_logs(:one)
  end

  test "visiting the index" do
    visit nutrition_logs_url
    assert_selector "h1", text: "Nutrition logs"
  end

  test "should create nutrition log" do
    visit nutrition_logs_url
    click_on "New nutrition log"

    fill_in "Calories current", with: @nutrition_log.calories_current
    fill_in "Calories max", with: @nutrition_log.calories_max
    fill_in "Protein current", with: @nutrition_log.protein_current
    fill_in "Protein max", with: @nutrition_log.protein_max
    fill_in "Sleep current", with: @nutrition_log.sleep_current
    fill_in "Sleep max", with: @nutrition_log.sleep_max
    fill_in "User", with: @nutrition_log.user_id
    click_on "Create Nutrition log"

    assert_text "Nutrition log was successfully created"
    click_on "Back"
  end

  test "should update Nutrition log" do
    visit nutrition_log_url(@nutrition_log)
    click_on "Edit this nutrition log", match: :first

    fill_in "Calories current", with: @nutrition_log.calories_current
    fill_in "Calories max", with: @nutrition_log.calories_max
    fill_in "Protein current", with: @nutrition_log.protein_current
    fill_in "Protein max", with: @nutrition_log.protein_max
    fill_in "Sleep current", with: @nutrition_log.sleep_current
    fill_in "Sleep max", with: @nutrition_log.sleep_max
    fill_in "User", with: @nutrition_log.user_id
    click_on "Update Nutrition log"

    assert_text "Nutrition log was successfully updated"
    click_on "Back"
  end

  test "should destroy Nutrition log" do
    visit nutrition_log_url(@nutrition_log)
    click_on "Destroy this nutrition log", match: :first

    assert_text "Nutrition log was successfully destroyed"
  end
end
