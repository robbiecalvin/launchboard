class JobApplication < ApplicationRecord
  belongs_to :job

  enum :status, { pending: 0, reviewed: 1, interviewing: 2, archived: 3 }, default: :pending

  validates :candidate_name, :email, :cover_letter, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :portfolio_url, :resume_url, format: { with: /\Ahttps?:\/\/.+\z/, message: "must start with http:// or https://" }, allow_blank: true
end
