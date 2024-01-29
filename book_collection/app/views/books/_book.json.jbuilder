json.extract! book, :id, :title, :author, :price, :published_date, :publisher, :pages, :release_date, :created_at, :updated_at
json.url book_url(book, format: :json)
