require 'spec_helper'

describe InstalmentsController do

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'pay'" do
    it "returns http success" do
      get 'pay'
      response.should be_success
    end
  end

  describe "GET 'pay_instalment'" do
    it "returns http success" do
      get 'pay_instalment'
      response.should be_success
    end
  end

end
