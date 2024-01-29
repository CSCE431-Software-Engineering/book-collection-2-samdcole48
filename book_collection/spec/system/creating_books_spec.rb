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
    fill_in 'Published date', with: '2001-01-02'
    fill_in 'Publisher', with: 'Test Publisher'
    fill_in 'Pages', with: '999'
    fill_in 'Release date', with: '2002-02-03'

    click_on 'Create Book'

    expect(page).to have_content('Test Title')
    expect(page).to have_content('Test Name')
    expect(page).to have_content('99.99')
    expect(page).to have_content('2001-01-02')
    expect(page).to have_content('Test Publisher')
    expect(page).to have_content('999')
    expect(page).to have_content('2002-02-03')

    book = Book.order(:id).last
    expect(book.title).to have_content('Test Title')
    expect(book.author).to have_content('Test Name')
    expect(book.price).to have_content('99.99')
    expect(book.published_date).to have_content('2001-01-02')
    expect(book.publisher).to have_content('Test Publisher')
    expect(book.pages).to have_content('999')
    expect(book.release_date).to have_content('2002-02-03')
  end

  it 'does not save the book if the title is invalid' do
    visit new_book_path

    fill_in 'Title', with: ''

    click_on 'Create Book'

    expect(page).to have_content("Title can't be blank")
  end

  it 'does not save the book if the publisher is invalid' do
    visit new_book_path

    fill_in 'Publisher', with: ''

    click_on 'Create Book'

    expect(page).to have_content("Publisher can't be blank")
  end

  it 'does not save the book if the pages is invalid' do
    visit new_book_path

    fill_in 'Pages', with: ''

    click_on 'Create Book'

    expect(page).to have_content("Pages can't be blank")
  end

  it 'does not save the book if the release date is invalid' do
    visit new_book_path

    fill_in 'Release date', with: ''

    click_on 'Create Book'

    expect(page).to have_content("Release date can't be blank")
  end

end
