class Company < ApplicationRecord
  has_many :jobs, dependent: :destroy

  before_validation :generate_slug

  validates :name, :location, :industry, :description, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :website, format: { with: /\Ahttps?:\/\/.+\z/, message: "must start with http:// or https://" }, allow_blank: true

  scope :alphabetical, -> { order(:name) }

  def to_param
    slug
  end

  def open_roles_count
    jobs.published.count
  end

  private

  def generate_slug
    self.slug = name.to_s.parameterize if slug.blank? && name.present?
  end
end
