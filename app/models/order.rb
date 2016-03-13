class Order < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :credit_card
  
  has_many   :order_items, dependent: :destroy
  
  belongs_to :billing_address, class_name: 'Address',  foreign_key: :billing_address_id
  belongs_to :shipping_address, class_name: 'Address', foreign_key: :shipping_address_id
  
  

  # validates :total_price, :completed_date, :state, presence: true
  # validates :total_price, numericality: true
  # validates :state, inclusion: { in: ['In progress', 'Completed', 'Shipped'] }

  

  
  def add_book(book_id, qty)
    if order_item = self.order_items.find_by(book_id: book_id)
      order_item.quantity += qty
      order_item.price += order_item.book.price * qty
    else
      order_item = self.order_items.new(book_id: book_id, quantity: qty)
      order_item.price = order_item.book.price * qty
    end
    order_item.save
  end


  # def add_book(book_id)

  #   current_item = order_items.find_by(book_id: book_id)
  #   if current_item
  #     current_item.quantity += 1
  #   else
  #     current_item = order_items.build(book_id: book_id)
  #   end
  #   current_item
  # end
end
