require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get landing page" do
    get root_url

    assert_response :success
    assert_select "h1", "Find a small-team Rails job worth building for"
  end
end
