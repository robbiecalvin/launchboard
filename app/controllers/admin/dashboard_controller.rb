class Admin::DashboardController < Admin::BaseController
  def index
    @company_count = Company.count
    @published_jobs_count = Job.published.count
    @application_count = JobApplication.count
    @recent_applications = JobApplication.includes(job: :company).order(created_at: :desc).limit(8)
  end
end
