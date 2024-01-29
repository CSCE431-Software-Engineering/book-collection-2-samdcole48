require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'is not valid without a title' do
    book = Book.new(title: nil)
    expect(book).not_to be_valid
  end

  it 'is not valid without a publisher' do
    book = Book.new(publisher: nil)
    expect(book).not_to be_valid
  end

  it 'is not valid without pages' do
    book = Book.new(pages: nil)
    expect(book).not_to be_valid
  end

  it 'is not valid without a release date' do
    book = Book.new(release_date: nil)
    expect(book).not_to be_valid
  end
end
