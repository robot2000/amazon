class Book < ActiveRecord::Base
  has_many :book_authors
  has_many :authors, through: :book_authors

  has_many :category_books
  has_many :categories, through: :category_books

  has_many :ratings, dependent: :destroy

  has_many :order_items
  before_destroy :ensure_not_referenced_by_any_order_item

  validates :title, :price, :qty, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :qty, numericality: { greater_than_or_equal_to: 1 }

  private

  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_order_item
    if order_items.empty?
      return true
    else
      errors.add(:base, 'Order Items present')
      return false
    end
  end
end
