class JobApplicationsController < ApplicationController
  def create
    @job = Job.published.includes(:company).find(params[:job_id])
    @job_application = @job.job_applications.new(job_application_params)

    if @job_application.save
      redirect_to job_path(@job), notice: "Application submitted. The team has everything they need to review it."
    else
      @related_jobs = Job.published.where(company: @job.company).where.not(id: @job.id).recent_first.limit(3)
      render "jobs/show", status: :unprocessable_entity
    end
  end

  private

  def job_application_params
    params.require(:job_application).permit(:candidate_name, :email, :portfolio_url, :resume_url, :cover_letter)
  end
end
