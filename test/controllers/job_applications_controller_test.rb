require "test_helper"

class JobApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "creates an application for a published job" do
    assert_difference("JobApplication.count", 1) do
      post job_job_applications_url(jobs(:one)), params: {
        job_application: {
          candidate_name: "Morgan Builder",
          email: "morgan@example.com",
          portfolio_url: "https://morgan.example.com",
          resume_url: "https://morgan.example.com/resume",
          cover_letter: "I would like to help build this product."
        }
      }
    end

    assert_redirected_to job_url(jobs(:one))
  end
end
