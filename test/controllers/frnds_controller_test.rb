require "test_helper"

class FrndsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @frnd = frnds(:one)
  end

  test "should get index" do
    get frnds_url
    assert_response :success
  end

  test "should get new" do
    get new_frnd_url
    assert_response :success
  end

  test "should create frnd" do
    assert_difference("Frnd.count") do
      post frnds_url, params: { frnd: { email: @frnd.email, first_name: @frnd.first_name, last_name: @frnd.last_name, phone: @frnd.phone, twitter: @frnd.twitter } }
    end

    assert_redirected_to frnd_url(Frnd.last)
  end

  test "should show frnd" do
    get frnd_url(@frnd)
    assert_response :success
  end

  test "should get edit" do
    get edit_frnd_url(@frnd)
    assert_response :success
  end

  test "should update frnd" do
    patch frnd_url(@frnd), params: { frnd: { email: @frnd.email, first_name: @frnd.first_name, last_name: @frnd.last_name, phone: @frnd.phone, twitter: @frnd.twitter } }
    assert_redirected_to frnd_url(@frnd)
  end

  test "should destroy frnd" do
    assert_difference("Frnd.count", -1) do
      delete frnd_url(@frnd)
    end

    assert_redirected_to frnds_url
  end
end
