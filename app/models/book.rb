class Book < ActiveRecord::Base
  has_many :book_authors
  has_many :authors, through: :book_authors

  has_many :category_books
  has_many :categories, through: :category_books

  has_many :ratings, dependent: :destroy

  validates :title, :price, :qty, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :qty, numericality: { greater_than_or_equal_to: 1 }
end
