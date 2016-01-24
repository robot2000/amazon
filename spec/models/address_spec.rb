require 'rails_helper'

RSpec.describe Address, type: :model do
  requaired_fields = %w(address zip city phone country)

  context 'attributes' do
    requaired_fields.each do |att|
      it { expect respond_to(att) }
      it { expect have_db_column(att) }
    end
  end

  context 'validation' do
    it 'address is valid' do
      expect(build(:address)).to be_valid
    end

    requaired_fields.each do |att|
      it { expect validate_presence_of(att) }
    end
  end
end
