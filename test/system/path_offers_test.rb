require "application_system_test_case"

class PathOffersTest < ApplicationSystemTestCase
  setup do
    @path_offer = path_offers(:one)
  end

  test "visiting the index" do
    visit path_offers_url
    assert_selector "h1", text: "Path Offers"
  end

  test "creating a Path offer" do
    visit path_offers_url
    click_on "New Path Offer"

    fill_in "Arrive", with: @path_offer.arrive
    check "Booked" if @path_offer.booked
    fill_in "Date arrive", with: @path_offer.date_arrive
    fill_in "Date departure", with: @path_offer.date_departure
    fill_in "Departure", with: @path_offer.departure
    check "Full" if @path_offer.full
    fill_in "Max available", with: @path_offer.max_available
    fill_in "Price", with: @path_offer.price
    fill_in "User", with: @path_offer.user_id
    fill_in "Vehicle", with: @path_offer.vehicle_id
    click_on "Create Path offer"

    assert_text "Path offer was successfully created"
    click_on "Back"
  end

  test "updating a Path offer" do
    visit path_offers_url
    click_on "Edit", match: :first

    fill_in "Arrive", with: @path_offer.arrive
    check "Booked" if @path_offer.booked
    fill_in "Date arrive", with: @path_offer.date_arrive
    fill_in "Date departure", with: @path_offer.date_departure
    fill_in "Departure", with: @path_offer.departure
    check "Full" if @path_offer.full
    fill_in "Max available", with: @path_offer.max_available
    fill_in "Price", with: @path_offer.price
    fill_in "User", with: @path_offer.user_id
    fill_in "Vehicle", with: @path_offer.vehicle_id
    click_on "Update Path offer"

    assert_text "Path offer was successfully updated"
    click_on "Back"
  end

  test "destroying a Path offer" do
    visit path_offers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Path offer was successfully destroyed"
  end
end
