require "test_helper"

class Admin::JobsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_jobs_url, headers: admin_headers

    assert_response :success
  end

  test "creates a job" do
    assert_difference("Job.count", 1) do
      post admin_jobs_url, headers: admin_headers, params: {
        job: {
          company_id: companies(:one).id,
          title: "Platform Engineer",
          location: "Remote",
          employment_type: "Full-time",
          salary_range: "$110k - $135k",
          status: :published,
          remote: true,
          featured: true,
          posted_on: Date.current,
          summary: "Build product infrastructure.",
          description: "Own backend features and keep the app maintainable."
        }
      }
    end

    assert_redirected_to admin_job_url(Job.order(:created_at).last)
  end
end
