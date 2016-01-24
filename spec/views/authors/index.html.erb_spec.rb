require 'rails_helper'

RSpec.describe "authors/index", type: :view do
  before(:each) do
    assign(:authors, [
      Author.create!(
        :name => "First Name",
        :biography => "MyText"
      ),
      Author.create!(
        :name => "First Name 2",
        :biography => "MyText 2"
      )
    ])
  end

  it "renders a list of authors" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 1
    assert_select "tr>td", :text => "MyText".to_s, :count => 1
  end
end
