class AdminController < ApplicationController
  before_filter :authorize_user

  private
  def authorize_user
    valid = authenticate_with_http_basic do |user, password|
      user = Authenticator.authenticate(user, password)
      user && user.have_role?(:admin)
    end

    request_http_basic_authentication unless valid
  end
end
