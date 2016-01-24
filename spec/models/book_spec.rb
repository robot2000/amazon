require 'rails_helper'

RSpec.describe Book, type: :model do

  context 'attributes' do
    it { expect have_db_column :title }
    it { expect have_db_column :description }
    it { expect have_db_column :price }
    it { expect have_db_column :in_stock }
  end

  context 'validation' do 
    it { expect validate_presence_of :title }
    it { expect validate_presence_of :price }
    it { expect validate_presence_of :in_stock }
    it { expect validate_numericality_of(:price).is_greater_than_or_equal_to(0.01) }
    it { expect validate_numericality_of(:price).is_greater_than_or_equal_to(1) }
  end

  context 'associations' do
    it { expect have_many(:authors).through(:book_authors) }
    it { expect have_many(:categories).through(:category_books) }
  end
end
