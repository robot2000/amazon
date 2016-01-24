require 'rails_helper'

RSpec.describe Rating, type: :model do
  
  context 'attributes' do
    it { expect have_db_column :review }
    it { expect have_db_column :value }
  end

  context 'validation' do 
    it { expect validate_numericality_of(:value)
      .is_greater_than_or_equal_to(1)
      .is_less_than_or_equal_to(10) 
    } 
  end

  context 'associations' do
    it { expect belong_to(:book) }
    it { expect belong_to(:customer) }
  end
end
