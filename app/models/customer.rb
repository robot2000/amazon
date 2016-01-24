class Customer < ActiveRecord::Base
  has_many :orders
  has_many :ratings

  validates :email, :password, :firstname, :lastname, presence: true
  validates :email, uniqueness: true
end
