class User < ActiveRecord::Base
  has_many :orders
  has_many :ratings
  has_many :orders, dependent: :destroy
  has_one  :credit_card, dependent: :destroy

  # has_one  :shipping_address, dependent: :destroy
  # has_one  :billing_address,  dependent: :destroy

  validates :email, :password, :firstname, :lastname, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
