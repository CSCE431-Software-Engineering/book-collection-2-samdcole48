class Book < ApplicationRecord
  validates :title, :author, :price, :published_date, :publisher, :pages, :release_date, presence: true
end
