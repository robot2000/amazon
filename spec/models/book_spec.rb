require 'rails_helper'

RSpec.describe Book, type: :model do

  context 'attributes' do
    it { should have_db_column :title }
    it { should have_db_column :description }
    it { should have_db_column :price }
    it { should have_db_column :qty }
  end

  context 'validation' do 
    it { should validate_presence_of :title }
    it { should validate_presence_of :price }
    it { should validate_presence_of :qty }
    it { should validate_numericality_of(:price).is_greater_than(0) }
    it { should validate_numericality_of(:qty).is_greater_than_or_equal_to(1) }
  end

  context 'associations' do
    it { should have_many(:authors).through(:book_authors) }
    it { should have_many(:categories).through(:category_books) }
    it { should have_many(:rating) }
  end
end
