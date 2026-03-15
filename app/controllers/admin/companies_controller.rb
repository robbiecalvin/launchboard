class Admin::CompaniesController < Admin::BaseController
  before_action :set_company, only: %i[show edit update destroy]

  def index
    @companies = Company.includes(:jobs).alphabetical
  end

  def show
    @jobs = @company.jobs.recent_first
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to admin_company_path(@company), notice: "Company created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to admin_company_path(@company), notice: "Company updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @company.destroy
    redirect_to admin_companies_path, notice: "Company removed."
  end

  private

  def set_company
    @company = Company.find_by!(slug: params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :location, :website, :industry, :description)
  end
end
