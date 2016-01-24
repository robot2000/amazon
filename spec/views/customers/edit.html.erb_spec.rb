require 'rails_helper'

RSpec.describe "customers/edit", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      :email => "email@mail.com",
      :password => "1234567890",
      :firstname => "John",
      :lastname => "Doe"
    ))
  end

  it "renders the edit customer form" do
    render

    assert_select "form[action=?][method=?]", customer_path(@customer), "post" do

      assert_select "input#customer_email[name=?]", "customer[email]"

      assert_select "input#customer_password[name=?]", "customer[password]"

      assert_select "input#customer_firstname[name=?]", "customer[firstname]"

      assert_select "input#customer_lastname[name=?]", "customer[lastname]"
    end
  end
end
