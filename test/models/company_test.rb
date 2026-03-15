require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  test "generates a slug from the name" do
    company = Company.create!(
      name: "Signal Works",
      location: "Calgary, AB",
      website: "https://signal.example.com",
      industry: "Consulting",
      description: "Product delivery consulting."
    )

    assert_equal "signal-works", company.slug
  end
end
