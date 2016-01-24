require 'rails_helper'

RSpec.describe Country, type: :model do
  context 'attributes' do
    it { expect have_db_column :name }
  end

  context 'validation' do 
    it { expect validate_presence_of :name }
    it { expect validate_uniqueness_of :name }
  end
end
