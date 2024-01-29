require 'rails_helper'

RSpec.describe "CreatingBooks", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'saves and displays the resulting book' do
    visit new_book_path

    fill_in 'Title', with: 'Test Title'
    fill_in 'Author', with: 'Test Name'
    fill_in 'Price', with: '99.99'
    fill_in 'Published date', with: '2003-01-02'

    click_on 'Create Book'

    expect(page).to have_content('Test Title')
    expect(page).to have_content('Test Name')
    expect(page).to have_content('99.99')
    expect(page).to have_content('2003-01-02')

    book = Book.order(:id).last
    expect(book.title).to have_content('Test Title')
    expect(book.author).to have_content('Test Name')
    expect(book.price).to have_content('99.99')
    expect(book.published_date).to have_content('2003-01-02')
  end
end
