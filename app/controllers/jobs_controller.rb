class JobsController < ApplicationController
  def index
    @filters = filter_params.to_h.compact_blank
    @companies = Company.alphabetical
    @locations = Job.published.distinct.order(:location).pluck(:location)
    @jobs = apply_filters(Job.published.includes(:company).recent_first)
  end

  def show
    @job = Job.published.includes(:company).find(params[:id])
    @job_application = @job.job_applications.new
    @related_jobs = Job.published.where(company: @job.company).where.not(id: @job.id).recent_first.limit(3)
  rescue ActiveRecord::RecordNotFound
    redirect_to jobs_path, alert: "That job is no longer available."
  end

  private

  def filter_params
    params.permit(:q, :location, :company_id, :remote)
  end

  def apply_filters(scope)
    scope = scope.where(company_id: @filters["company_id"]) if @filters["company_id"].present?
    scope = scope.where(location: @filters["location"]) if @filters["location"].present?
    scope = scope.where(remote: true) if @filters["remote"] == "1"

    return scope if @filters["q"].blank?

    query = "%#{@filters["q"].strip.downcase}%"
    scope.joins(:company).where("LOWER(jobs.title) LIKE :query OR LOWER(companies.name) LIKE :query OR LOWER(jobs.summary) LIKE :query", query: query)
  end
end
