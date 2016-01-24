require 'rails_helper'

RSpec.describe "customers/show", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      :email => "email@mail.com",
      :password => "1234567890",
      :firstname => "John",
      :lastname => "Doe"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Firstname/)
    expect(rendered).to match(/Lastname/)
  end
end
