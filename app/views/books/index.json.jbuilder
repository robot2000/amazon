json.array!(@books) do |book|
  json.extract! book, :id, :title, :description, :price, :qty
  json.url book_url(book, format: :json)
end
