require "test_helper"

class JobTest < ActiveSupport::TestCase
  test "published scope excludes drafts" do
    draft = Job.create!(
      company: companies(:one),
      title: "Draft role",
      location: "Remote",
      employment_type: "Contract",
      salary_range: "$90k",
      status: :draft,
      remote: true,
      summary: "Draft summary",
      description: "Draft description"
    )

    assert_not_includes Job.published, draft
    assert_includes Job.published, jobs(:one)
  end
end
