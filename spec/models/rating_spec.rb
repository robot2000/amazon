require 'rails_helper'

RSpec.describe Rating, type: :model do
  
  context 'attributes' do
    it { should have_db_column :review }
    it { should have_db_column :value }
  end

  context 'validation' do 
    it { should validate_numericality_of(:value)
      .is_greater_than_or_equal_to(1)
      .is_less_than_or_equal_to(10) 
    } 
  end

  context 'associations' do
    it { should belong_to(:book) }
    it { should belong_to(:user) }
  end
end
