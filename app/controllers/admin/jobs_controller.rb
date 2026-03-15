class Admin::JobsController < Admin::BaseController
  before_action :set_job, only: %i[show edit update destroy]

  def index
    @jobs = Job.includes(:company, :job_applications).order(created_at: :desc)
  end

  def show
    @applications = @job.job_applications.order(created_at: :desc)
  end

  def new
    preset_attributes = params.fetch(:job, ActionController::Parameters.new).permit(:company_id).to_h
    @job = Job.new({ posted_on: Date.current, status: :published }.merge(preset_attributes))
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to admin_job_path(@job), notice: "Job posted."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to admin_job_path(@job), notice: "Job updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @job.destroy
    redirect_to admin_jobs_path, notice: "Job removed."
  end

  private

  def set_job
    @job = Job.includes(:company, :job_applications).find(params[:id])
  end

  def job_params
    params.require(:job).permit(:company_id, :title, :location, :employment_type, :salary_range, :status, :remote, :summary, :description, :featured, :posted_on)
  end
end
