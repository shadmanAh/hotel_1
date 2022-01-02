require "application_system_test_case"

class ReservesTest < ApplicationSystemTestCase
  setup do
    @reserf = reserves(:one)
  end

  test "visiting the index" do
    visit reserves_url
    assert_selector "h1", text: "Reserves"
  end

  test "creating a Reserf" do
    visit reserves_url
    click_on "New Reserf"

    fill_in "Adults", with: @reserf.adults
    fill_in "Check in", with: @reserf.check_in
    fill_in "Check out", with: @reserf.check_out
    fill_in "Children", with: @reserf.children
    fill_in "First name", with: @reserf.first_name
    fill_in "Last name", with: @reserf.last_name
    fill_in "Phone num", with: @reserf.phone_num
    fill_in "Room", with: @reserf.room_id
    fill_in "User", with: @reserf.user_id
    click_on "Create Reserf"

    assert_text "Reserf was successfully created"
    click_on "Back"
  end

  test "updating a Reserf" do
    visit reserves_url
    click_on "Edit", match: :first

    fill_in "Adults", with: @reserf.adults
    fill_in "Check in", with: @reserf.check_in
    fill_in "Check out", with: @reserf.check_out
    fill_in "Children", with: @reserf.children
    fill_in "First name", with: @reserf.first_name
    fill_in "Last name", with: @reserf.last_name
    fill_in "Phone num", with: @reserf.phone_num
    fill_in "Room", with: @reserf.room_id
    fill_in "User", with: @reserf.user_id
    click_on "Update Reserf"

    assert_text "Reserf was successfully updated"
    click_on "Back"
  end

  test "destroying a Reserf" do
    visit reserves_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reserf was successfully destroyed"
  end
end
