require "test_helper"

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_root_url, headers: admin_headers

    assert_response :success
  end
end
