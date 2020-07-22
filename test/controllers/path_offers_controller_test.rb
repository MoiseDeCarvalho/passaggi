require 'test_helper'

class PathOffersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @path_offer = path_offers(:one)
  end

  test "should get index" do
    get path_offers_url
    assert_response :success
  end

  test "should get new" do
    get new_path_offer_url
    assert_response :success
  end

  test "should create path_offer" do
    assert_difference('PathOffer.count') do
      post path_offers_url, params: { path_offer: { arrive: @path_offer.arrive, booked: @path_offer.booked, date_arrive: @path_offer.date_arrive, date_departure: @path_offer.date_departure, departure: @path_offer.departure, full: @path_offer.full, max_available: @path_offer.max_available, price: @path_offer.price, user_id: @path_offer.user_id, vehicle_id: @path_offer.vehicle_id } }
    end

    assert_redirected_to path_offer_url(PathOffer.last)
  end

  test "should show path_offer" do
    get path_offer_url(@path_offer)
    assert_response :success
  end

  test "should get edit" do
    get edit_path_offer_url(@path_offer)
    assert_response :success
  end

  test "should update path_offer" do
    patch path_offer_url(@path_offer), params: { path_offer: { arrive: @path_offer.arrive, booked: @path_offer.booked, date_arrive: @path_offer.date_arrive, date_departure: @path_offer.date_departure, departure: @path_offer.departure, full: @path_offer.full, max_available: @path_offer.max_available, price: @path_offer.price, user_id: @path_offer.user_id, vehicle_id: @path_offer.vehicle_id } }
    assert_redirected_to path_offer_url(@path_offer)
  end

  test "should destroy path_offer" do
    assert_difference('PathOffer.count', -1) do
      delete path_offer_url(@path_offer)
    end

    assert_redirected_to path_offers_url
  end
end
