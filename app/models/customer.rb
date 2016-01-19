class Customer < ActiveRecord::Base
  has_many :orders
  has_many :ratings

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
end
