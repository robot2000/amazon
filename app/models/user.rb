class User < ActiveRecord::Base
  has_many :orders
  has_many :ratings
  has_many :orders, dependent: :destroy
  has_one  :credit_card, dependent: :destroy

  #has_many  :billing_address, class_name: 'Address',  foreign_key: :billing_address_id
  #has_many  :shipping_address, class_name: 'Address', foreign_key: :shipping_address_id

  validates :email, :password, :firstname, :lastname, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :omniauthable,
         :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.firstname = auth.info.name.split[0]   # assuming the user model has a name
      user.lastname = auth.info.name.split[1]
      # user.image = auth.info.image # assuming the user model has an image
    end
  end
end
