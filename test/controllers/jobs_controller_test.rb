require "test_helper"

class JobsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get jobs_url

    assert_response :success
    assert_select "h1", "Open roles"
  end

  test "should get show" do
    get job_url(jobs(:one))

    assert_response :success
    assert_select "h1", jobs(:one).title
  end
end
