class HomeController < ApplicationController
  def index
    published_jobs = Job.published.includes(:company).recent_first
    @featured_jobs = published_jobs.featured.limit(3)
    @latest_jobs = published_jobs.limit(6)
    @stats = {
      companies: Company.count,
      open_roles: Job.published.count,
      applications: JobApplication.count
    }
  end
end
