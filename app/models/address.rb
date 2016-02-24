class Address < ActiveRecord::Base
  
  #belongs_to :country

  validates :address, :zip, :city, :phone, :country, presence: true
end
