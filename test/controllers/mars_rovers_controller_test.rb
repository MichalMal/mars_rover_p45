require 'test_helper'

class MarsRoversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mars_rover = mars_rovers(:one)
  end

  test "should get index" do
    get mars_rovers_url
    assert_response :success
  end

  test "should get new" do
    get new_mars_rover_url
    assert_response :success
  end

  test "should create mars_rover" do
    assert_difference('MarsRover.count') do
      post mars_rovers_url, params: { mars_rover: { name: @mars_rover.name, orientation: @mars_rover.orientation, x_coordinate: @mars_rover.x_coordinate, y_coordinate: @mars_rover.y_coordinate } }
    end

    assert_redirected_to mars_rover_url(MarsRover.last)
  end

  test "should show mars_rover" do
    get mars_rover_url(@mars_rover)
    assert_response :success
  end

  test "should get edit" do
    get edit_mars_rover_url(@mars_rover)
    assert_response :success
  end

  test "should update mars_rover" do
    patch mars_rover_url(@mars_rover), params: { mars_rover: { name: @mars_rover.name, orientation: @mars_rover.orientation, x_coordinate: @mars_rover.x_coordinate, y_coordinate: @mars_rover.y_coordinate } }
    assert_redirected_to mars_rover_url(@mars_rover)
  end

  test "should destroy mars_rover" do
    assert_difference('MarsRover.count', -1) do
      delete mars_rover_url(@mars_rover)
    end

    assert_redirected_to mars_rovers_url
  end
end
