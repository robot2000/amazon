require 'rails_helper'

RSpec.describe Category, type: :model do
  
  context 'attributes' do
    it { expect have_db_column :title }
  end

  context 'validation' do 
    it { expect validate_presence_of :title }
    it { expect validate_uniqueness_of :title }
  end

  context 'associations' do
    it { expect have_many(:books).through(:category_books) }
  end
end
