require 'rails_helper'

RSpec.describe Country, type: :model do
  context 'attributes' do
    it { should have_db_column :name }
    it { should respond_to(:name) }
  end

  context 'validation' do 
    it { should validate_presence_of :name }
    #it { should validate_uniqueness_of(:name).case_insensitive }
    it { expect(build(:country)).to validate_uniqueness_of(:name) }
  end
end
