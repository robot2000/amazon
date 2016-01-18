class Category < ActiveRecord::Base
  has_many :category_books
  has_many :books, through: :category_books

  validates :title, presence: true, uniqueness: true
end
