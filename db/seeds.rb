companies = [
  {
    name: "Northstar Studio",
    location: "Vancouver, BC",
    website: "https://northstar.example.com",
    industry: "Product Design",
    description: "Northstar helps early-stage teams ship thoughtful product experiences without bloated process."
  },
  {
    name: "Harbor Health",
    location: "Seattle, WA",
    website: "https://harborhealth.example.com",
    industry: "Health Tech",
    description: "Harbor Health builds calmer internal tools for clinics that are tired of slow software."
  },
  {
    name: "Pinepeak Logistics",
    location: "Portland, OR",
    website: "https://pinepeak.example.com",
    industry: "Logistics",
    description: "Pinepeak modernizes freight operations with simple, operator-first tooling."
  }
]

jobs = [
  {
    company_name: "Northstar Studio",
    title: "Rails Product Engineer",
    location: "Vancouver, BC",
    employment_type: "Full-time",
    salary_range: "$105k - $130k",
    remote: true,
    featured: true,
    summary: "Build client-facing Rails features and shape product decisions with design partners.",
    description: "You will own scoped features end-to-end, work directly with designers, and keep the codebase easy to extend. Strong Rails fundamentals and good product judgment matter more than resume prestige.",
    posted_on: Date.current - 2.days
  },
  {
    company_name: "Harbor Health",
    title: "Full-Stack Rails Developer",
    location: "Seattle, WA",
    employment_type: "Full-time",
    salary_range: "$120k - $145k",
    remote: false,
    featured: true,
    summary: "Improve operational workflows for clinic teams using Rails, Hotwire-free server rendering, and thoughtful UX.",
    description: "This role focuses on backend-heavy product development, clean domain modeling, and reliable forms-based workflows for healthcare operations.",
    posted_on: Date.current - 5.days
  },
  {
    company_name: "Pinepeak Logistics",
    title: "Junior Rails Developer",
    location: "Portland, OR",
    employment_type: "Full-time",
    salary_range: "$75k - $92k",
    remote: true,
    featured: false,
    summary: "Join a small team shipping internal tools for dispatch, pricing, and reporting.",
    description: "You will work across models, controllers, and views while learning how production Rails apps are shaped. Comfort with tests and debugging is a plus.",
    posted_on: Date.current - 1.day
  },
  {
    company_name: "Northstar Studio",
    title: "Contract Ruby Engineer",
    location: "Remote",
    employment_type: "Contract",
    salary_range: "$70 - $95/hr",
    remote: true,
    featured: false,
    summary: "Help stabilize a legacy Rails app and ship a focused admin workflow refresh.",
    description: "Ideal for someone who enjoys incrementally improving existing code while balancing speed, clarity, and low regression risk.",
    posted_on: Date.current - 8.days
  }
]

companies.each do |attributes|
  company = Company.find_or_initialize_by(name: attributes[:name])
  company.update!(attributes)
end

jobs.each do |attributes|
  company = Company.find_by!(name: attributes.delete(:company_name))
  job = company.jobs.find_or_initialize_by(title: attributes[:title])
  job.update!(attributes.merge(status: :published))
end

featured_job = Job.published.featured.first

if featured_job.present?
  featured_job.job_applications.find_or_create_by!(email: "candidate@example.com") do |application|
    application.candidate_name = "Robin Candidate"
    application.portfolio_url = "https://portfolio.example.com"
    application.resume_url = "https://resume.example.com"
    application.cover_letter = "I like small Rails teams, clear ownership, and shipping polished CRUD that solves a real business problem."
  end
end
