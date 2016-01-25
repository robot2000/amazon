class CreditCard < ActiveRecord::Base
  belongs_to :customer
  has_many :orders

  validates :number, presence: true
  validates :cvv, presence: true
  validates :expiration_month, presence: true
  validates :expiration_year, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
end
