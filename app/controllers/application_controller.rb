class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def authenticate_admin
    authenticate_or_request_with_http_basic do |user, password|
      user == ENV["ADMIN_USER"] && password == ENV["ADMIN_PASS"]
    end
  end
end
