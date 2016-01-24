require 'rails_helper'

RSpec.describe Customer, type: :model do
  
  context 'attributes' do
    it { expect have_db_column :email }
    it { expect have_db_column :password }
    it { expect have_db_column :firstname }
    it { expect have_db_column :lastname }
  end

  context 'validation' do 
    it { expect validate_presence_of :email }
    it { expect validate_presence_of :password }
    it { expect validate_presence_of :firstname }
    it { expect validate_presence_of :lastname }
    it { expect validate_uniqueness_of :email }
  end

  context 'associations' do
  #  it { expect have_many(:orders) }
    it { expect have_many(:ratings) }
  end
end
