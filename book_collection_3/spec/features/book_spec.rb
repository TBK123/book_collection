require 'rails_helper'

RSpec.feature "Books", type: :feature do
  scenario "create a new book" do
    visit new_book_path
    fill_in "Title", with: "Sample Book"
    click_button "Create Book"
    expect(page).to have_content("Book was successfully created.")
  end

  scenario "fail to create a book without a title" do
    visit new_book_path
    click_button "Create Book"
    expect(page).to have_content("Title can't be blank")
  end
end
