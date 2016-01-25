require 'rails_helper'

RSpec.describe Order, type: :model do
  
  context 'attributes' do
    it { expect have_db_column :total_price }
    it { expect have_db_column :completed_date }
    it { expect have_db_column :state }
  end

  context 'validation' do 
    it { expect validate_presence_of :total_price }
    it { expect validate_presence_of :completed_date }
    it { expect validate_presence_of :state }
    it { expect validate_inclusion_of(:state).in_array(['In progress', 'Shipped', 'Completed']) }
  end

   context 'associations' do
    it { expect belong_to(:customer) }
    it { expect belong_to(:credit_card) }
    it { expect have_many(:order_items) }
    it { expect belong_to(:billing_address) }
    it { expect belong_to(:shipping_address) }
  end
end
