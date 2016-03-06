class Country < ActiveRecord::Base
  
  #has_many :addresses

  belongs_to :address
  validates :name, presence: true, uniqueness: true
end
