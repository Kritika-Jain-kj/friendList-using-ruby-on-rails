require "application_system_test_case"

class FrndsTest < ApplicationSystemTestCase
  setup do
    @frnd = frnds(:one)
  end

  test "visiting the index" do
    visit frnds_url
    assert_selector "h1", text: "Frnds"
  end

  test "should create frnd" do
    visit frnds_url
    click_on "New frnd"

    fill_in "Email", with: @frnd.email
    fill_in "First name", with: @frnd.first_name
    fill_in "Last name", with: @frnd.last_name
    fill_in "Phone", with: @frnd.phone
    fill_in "Twitter", with: @frnd.twitter
    click_on "Create Frnd"

    assert_text "Frnd was successfully created"
    click_on "Back"
  end

  test "should update Frnd" do
    visit frnd_url(@frnd)
    click_on "Edit this frnd", match: :first

    fill_in "Email", with: @frnd.email
    fill_in "First name", with: @frnd.first_name
    fill_in "Last name", with: @frnd.last_name
    fill_in "Phone", with: @frnd.phone
    fill_in "Twitter", with: @frnd.twitter
    click_on "Update Frnd"

    assert_text "Frnd was successfully updated"
    click_on "Back"
  end

  test "should destroy Frnd" do
    visit frnd_url(@frnd)
    click_on "Destroy this frnd", match: :first

    assert_text "Frnd was successfully destroyed"
  end
end
