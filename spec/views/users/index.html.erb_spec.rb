require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :login => "Login",
        :password_hash => "Password Hash",
        :password_salt => "Password Salt",
        :name => "Name",
        :email => "Email"
      ),
      stub_model(User,
        :login => "Login",
        :password_hash => "Password Hash",
        :password_salt => "Password Salt",
        :name => "Name",
        :email => "Email"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Login".to_s, :count => 2
    assert_select "tr>td", :text => "Password Hash".to_s, :count => 2
    assert_select "tr>td", :text => "Password Salt".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
