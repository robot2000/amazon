require 'rails_helper'

RSpec.describe Order, type: :model do
  
  context 'attributes' do
    it { should have_db_column :total_price }
    it { should have_db_column :completed_date }
    it { should have_db_column :state }
  end

  context 'validation' do 
    it { should validate_presence_of :total_price }
    it { should validate_presence_of :completed_date }
    it { should validate_presence_of :state }
    it { should validate_inclusion_of(:state).in_array(['In progress', 'Shipped', 'Completed']) }
  end

   context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:credit_card) }
    # it { should have_many(:order_items) }
    it { should belong_to(:billing_address) }
    it { should belong_to(:shipping_address) }
  end
end
