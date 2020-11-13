require "application_system_test_case"

class MarsRoversTest < ApplicationSystemTestCase
  setup do
    @mars_rover = mars_rovers(:one)
  end

  test "visiting the index" do
    visit mars_rovers_url
    assert_selector "h1", text: "Mars Rovers"
  end

  test "creating a Mars rover" do
    visit mars_rovers_url
    click_on "New Mars Rover"

    fill_in "Name", with: @mars_rover.name
    fill_in "Orientation", with: @mars_rover.orientation
    fill_in "X coordinate", with: @mars_rover.x_coordinate
    fill_in "Y coordinate", with: @mars_rover.y_coordinate
    click_on "Create Mars rover"

    assert_text "Mars rover was successfully created"
    click_on "Back"
  end

  test "updating a Mars rover" do
    visit mars_rovers_url
    click_on "Edit", match: :first

    fill_in "Name", with: @mars_rover.name
    fill_in "Orientation", with: @mars_rover.orientation
    fill_in "X coordinate", with: @mars_rover.x_coordinate
    fill_in "Y coordinate", with: @mars_rover.y_coordinate
    click_on "Update Mars rover"

    assert_text "Mars rover was successfully updated"
    click_on "Back"
  end

  test "destroying a Mars rover" do
    visit mars_rovers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mars rover was successfully destroyed"
  end
end
