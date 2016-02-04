require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  context 'attributes' do
    it { should have_db_column :number }
    it { should have_db_column :cvv }
    it { should have_db_column :expiration_month }
    it { should have_db_column :expiration_year }
    it { should have_db_column :firstname }
    it { should have_db_column :lastname }
  end

  context 'validation' do 
    it { should validate_presence_of :number }
    it { should validate_presence_of :cvv }
    it { should validate_presence_of :expiration_month }
    it { should validate_presence_of :expiration_year }
    it { should validate_presence_of :firstname }
    it { should validate_presence_of :lastname }
  end

  context 'associations' do
    it { should have_many(:orders)}
    it { should belong_to(:user) }
  end
end
