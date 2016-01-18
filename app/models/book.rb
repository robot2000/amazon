class Book < ActiveRecord::Base
  has_many :book_authors
  has_many :authors, through: :book_authors

  has_many :category_books
  has_many :categories, through: :category_books

  validates :title, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0.01}
end
