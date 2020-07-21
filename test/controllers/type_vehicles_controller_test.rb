require 'test_helper'

class TypeVehiclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_vehicle = type_vehicles(:one)
  end

  test "should get index" do
    get type_vehicles_url
    assert_response :success
  end

  test "should get new" do
    get new_type_vehicle_url
    assert_response :success
  end

  test "should create type_vehicle" do
    assert_difference('TypeVehicle.count') do
      post type_vehicles_url, params: { type_vehicle: { tipo: @type_vehicle.tipo } }
    end

    assert_redirected_to type_vehicle_url(TypeVehicle.last)
  end

  test "should show type_vehicle" do
    get type_vehicle_url(@type_vehicle)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_vehicle_url(@type_vehicle)
    assert_response :success
  end

  test "should update type_vehicle" do
    patch type_vehicle_url(@type_vehicle), params: { type_vehicle: { tipo: @type_vehicle.tipo } }
    assert_redirected_to type_vehicle_url(@type_vehicle)
  end

  test "should destroy type_vehicle" do
    assert_difference('TypeVehicle.count', -1) do
      delete type_vehicle_url(@type_vehicle)
    end

    assert_redirected_to type_vehicles_url
  end
end
