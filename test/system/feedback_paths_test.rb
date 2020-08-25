require "application_system_test_case"

class FeedbackPathsTest < ApplicationSystemTestCase
  setup do
    @feedback_path = feedback_paths(:one)
  end

  test "visiting the index" do
    visit feedback_paths_url
    assert_selector "h1", text: "Feedback Paths"
  end

  test "creating a Feedback path" do
    visit feedback_paths_url
    click_on "New Feedback Path"

    fill_in "Path offers", with: @feedback_path.path_offers_id
    fill_in "User", with: @feedback_path.user_id
    click_on "Create Feedback path"

    assert_text "Feedback path was successfully created"
    click_on "Back"
  end

  test "updating a Feedback path" do
    visit feedback_paths_url
    click_on "Edit", match: :first

    fill_in "Path offers", with: @feedback_path.path_offers_id
    fill_in "User", with: @feedback_path.user_id
    click_on "Update Feedback path"

    assert_text "Feedback path was successfully updated"
    click_on "Back"
  end

  test "destroying a Feedback path" do
    visit feedback_paths_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Feedback path was successfully destroyed"
  end
end
