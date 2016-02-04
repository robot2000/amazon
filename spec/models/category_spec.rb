require 'rails_helper'

RSpec.describe Category, type: :model do
  
  context 'attributes' do
    it { should have_db_column :title }
  end

  context 'validation' do
    it { expect(build(:category)).to validate_presence_of(:title) }
    it { expect(build(:category)).to validate_uniqueness_of(:title) }
  end

  context 'associations' do
    it { should have_many(:books).through(:category_books) }
  end
end
