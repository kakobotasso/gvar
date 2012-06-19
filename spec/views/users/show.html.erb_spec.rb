require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :login => "Login",
      :password_hash => "Password Hash",
      :password_salt => "Password Salt",
      :name => "Name",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Login/)
    rendered.should match(/Password Hash/)
    rendered.should match(/Password Salt/)
    rendered.should match(/Name/)
    rendered.should match(/Email/)
  end
end
