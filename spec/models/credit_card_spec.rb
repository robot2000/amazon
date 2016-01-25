require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  context 'attributes' do
    it { expect have_db_column :number }
    it { expect have_db_column :cvv }
    it { expect have_db_column :expiration_month }
    it { expect have_db_column :expiration_year }
    it { expect have_db_column :firstname }
    it { expect have_db_column :lastname }
  end

  context 'validation' do 
    it { expect validate_presence_of :number }
    it { expect validate_presence_of :cvv }
    it { expect validate_presence_of :expiration_month }
    it { expect validate_presence_of :expiration_year }
    it { expect validate_presence_of :firstname }
    it { expect validate_presence_of :lastname }
  end

  context 'associations' do
    it { expect have_many(:orders)}
    it { expect belong_to(:customer) }
  end
end
