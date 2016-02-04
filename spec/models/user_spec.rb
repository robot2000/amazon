require 'rails_helper'

RSpec.describe User, type: :model do
  
  context 'attributes' do
    it { should have_db_column :email }
    it { should have_db_column :encrypted_password }
    it { should have_db_column :firstname }
    it { should have_db_column :lastname }
  end

  context 'validation' do 
    it { should validate_presence_of :email }
    it { should validate_presence_of :encrypted_password }
    it { should validate_presence_of :firstname }
    it { should validate_presence_of :lastname }
   # it { expect(build(:user)).to validate_uniqueness_of(:email) }
  end

  context 'associations' do
    it { should have_many(:orders) }
    it { should have_many(:ratings) }
  end
end
