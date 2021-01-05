require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
  end

  test "should get about" do
    get about_url, headers: sign_in_admin_header
    assert_response :success
  end
end
