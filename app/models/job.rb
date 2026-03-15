class Job < ApplicationRecord
  belongs_to :company
  has_many :job_applications, dependent: :destroy

  enum :status, { draft: 0, published: 1, closed: 2 }, default: :published

  before_validation :set_posted_on, if: :published?

  validates :title, :location, :employment_type, :summary, :description, presence: true
  validates :salary_range, length: { maximum: 100 }

  scope :published, -> { where(status: statuses[:published]) }
  scope :featured, -> { where(featured: true) }
  scope :recent_first, -> { order(posted_on: :desc, created_at: :desc) }

  def remote_label
    remote? ? "Remote-friendly" : "On-site"
  end

  private

  def set_posted_on
    self.posted_on ||= Date.current
  end
end
