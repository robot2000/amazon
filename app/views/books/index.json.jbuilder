json.array!(@books) do |book|
  json.extract! book, :id, :title, :description, :price, :in_stock
  json.url book_url(book, format: :json)
end
