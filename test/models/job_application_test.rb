require "test_helper"

class JobApplicationTest < ActiveSupport::TestCase
  test "requires a valid email" do
    application = JobApplication.new(
      job: jobs(:one),
      candidate_name: "Taylor",
      email: "not-an-email",
      cover_letter: "Interested in the role."
    )

    assert_not application.valid?
    assert_includes application.errors[:email], "is invalid"
  end
end
