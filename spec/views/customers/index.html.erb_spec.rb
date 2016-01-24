require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        :email => "email@mail.com",
        :password => "1234567890",
        :firstname => "John",
        :lastname => "Doe"
      ),
      Customer.create!(
        :email => "email2@mail.com",
        :password => "1234567890",
        :firstname => "John",
        :lastname => "Doe"
      )
    ])
  end

  it "renders a list of customers" do
    render
    assert_select "tr>td", :text => "email@mail.com".to_s, :count => 1
    assert_select "tr>td", :text => "1234567890".to_s, :count => 2
    assert_select "tr>td", :text => "John".to_s, :count => 2
    assert_select "tr>td", :text => "Doe".to_s, :count => 2
  end
end
