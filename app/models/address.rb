class Address < ActiveRecord::Base
  validates :address, :zip, :city, :phone, :country, presence: true
end
