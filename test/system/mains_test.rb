require "application_system_test_case"

class MainsTest < ApplicationSystemTestCase
  setup do
    @main = mains(:one)
  end

  test "visiting the index" do
    visit mains_url
    assert_selector "h1", text: "Mains"
  end

  test "creating a Main" do
    visit mains_url
    click_on "New Main"

    fill_in "First description", with: @main.first_description
    fill_in "First title", with: @main.first_title
    fill_in "Second description", with: @main.second_description
    fill_in "Second title", with: @main.second_title
    click_on "Create Main"

    assert_text "Main was successfully created"
    click_on "Back"
  end

  test "updating a Main" do
    visit mains_url
    click_on "Edit", match: :first

    fill_in "First description", with: @main.first_description
    fill_in "First title", with: @main.first_title
    fill_in "Second description", with: @main.second_description
    fill_in "Second title", with: @main.second_title
    click_on "Update Main"

    assert_text "Main was successfully updated"
    click_on "Back"
  end

  test "destroying a Main" do
    visit mains_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Main was successfully destroyed"
  end
end
