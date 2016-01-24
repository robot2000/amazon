require 'rails_helper'

RSpec.describe Author, type: :model do

  context 'attributes' do
    it { expect have_db_column :name }
    it { expect have_db_column :biography }
  end

  context 'validation' do
    it 'author is valid' do
      expect(build(:author)).to be_valid
    end

    it { expect(build(:author)).to validate_presence_of(:name) }
    it { expect(build(:author)).to validate_uniqueness_of(:name) }
  end

  context 'associations' do
    it { expect have_many(:books).through(:book_authors) }
  end
end
