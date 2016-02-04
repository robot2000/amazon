require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  
  context 'attributes' do
    it { should have_db_column :price }
    it { should have_db_column :quantity }
  end

  context 'validation' do 
    it { should validate_presence_of :price }
    it { should validate_presence_of :quantity }
  end

  context 'associations' do
    it { should belong_to(:book) }
    it { should belong_to(:order) }
  end
end
