require 'rails_helper'

RSpec.describe BookAuthor, type: :model do
  requaired_fields = %w(book author)

  context 'attributes' do
    requaired_fields.each do |att|
      it { expect respond_to(att) }
    end
  end
end
