require 'test_helper'

class FeedbackPathsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feedback_path = feedback_paths(:one)
  end

  test "should get index" do
    get feedback_paths_url
    assert_response :success
  end

  test "should get new" do
    get new_feedback_path_url
    assert_response :success
  end

  test "should create feedback_path" do
    assert_difference('FeedbackPath.count') do
      post feedback_paths_url, params: { feedback_path: { path_offers_id: @feedback_path.path_offers_id, user_id: @feedback_path.user_id } }
    end

    assert_redirected_to feedback_path_url(FeedbackPath.last)
  end

  test "should show feedback_path" do
    get feedback_path_url(@feedback_path)
    assert_response :success
  end

  test "should get edit" do
    get edit_feedback_path_url(@feedback_path)
    assert_response :success
  end

  test "should update feedback_path" do
    patch feedback_path_url(@feedback_path), params: { feedback_path: { path_offers_id: @feedback_path.path_offers_id, user_id: @feedback_path.user_id } }
    assert_redirected_to feedback_path_url(@feedback_path)
  end

  test "should destroy feedback_path" do
    assert_difference('FeedbackPath.count', -1) do
      delete feedback_path_url(@feedback_path)
    end

    assert_redirected_to feedback_paths_url
  end
end
