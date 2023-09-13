require 'rails_helper'

RSpec.describe Book, type: :model do
  it "is valid with valid attributes" do
    book = Book.new(title: "Sample Book")
    expect(book).to be_valid
  end

  it "is not valid without a title" do
    book = Book.new(title: nil)
    expect(book).to_not be_valid
  end
end

it "is valid with all attributes" do
  book = Book.new(title: "Sample Book", author: "Author Name", price: 10.5, published_date: Date.today)
  expect(book).to be_valid
end
