require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "Books"
  end

  test "creating a Book" do
    visit books_url
    click_on "New Book"

    fill_in "Adult", with: @book.adult
    fill_in "Check in", with: @book.check_in
    fill_in "Check out", with: @book.check_out
    fill_in "Children", with: @book.children
    fill_in "First name", with: @book.first_name
    fill_in "Last name", with: @book.last_name
    fill_in "Phone", with: @book.phone
    click_on "Create Book"

    assert_text "Book was successfully created"
    click_on "Back"
  end

  test "updating a Book" do
    visit books_url
    click_on "Edit", match: :first

    fill_in "Adult", with: @book.adult
    fill_in "Check in", with: @book.check_in
    fill_in "Check out", with: @book.check_out
    fill_in "Children", with: @book.children
    fill_in "First name", with: @book.first_name
    fill_in "Last name", with: @book.last_name
    fill_in "Phone", with: @book.phone
    click_on "Update Book"

    assert_text "Book was successfully updated"
    click_on "Back"
  end

  test "destroying a Book" do
    visit books_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Book was successfully destroyed"
  end
end
