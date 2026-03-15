require "test_helper"

class Admin::CompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_companies_url, headers: admin_headers

    assert_response :success
  end

  test "creates a company" do
    assert_difference("Company.count", 1) do
      post admin_companies_url, headers: admin_headers, params: {
        company: {
          name: "Signal Works",
          location: "Calgary, AB",
          website: "https://signal.example.com",
          industry: "Consulting",
          description: "Shipping product work for startups."
        }
      }
    end

    assert_redirected_to admin_company_url(Company.order(:created_at).last)
  end
end
