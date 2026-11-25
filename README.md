# Launchboard

Launchboard is a small Rails job board built as a portfolio project. It demonstrates how a conventional Ruby on Rails app is structured around MVC, RESTful routing, Active Record associations, request tests, seed data, and a lightweight admin workflow.

## What it does

- Public landing page with featured jobs and recent openings
- Search and filter jobs by company, location, and remote-only status
- Public job detail page with a candidate application form
- Admin dashboard protected with HTTP Basic Auth
- Admin CRUD flows for companies and jobs
- Seed data so the app looks finished immediately after setup

## Stack

- Ruby 4.0.1
- Rails 7.2.3
- SQLite3
- Minitest

## Project structure

- `Company` has many `Job` records
- `Job` belongs to a `Company` and has many `JobApplication` records
- `JobApplication` belongs to a `Job`

The public side lives in:

- `HomeController`
- `JobsController`
- `JobApplicationsController`

The admin side lives in:

- `Admin::DashboardController`
- `Admin::CompaniesController`
- `Admin::JobsController`

## Local setup

1. Ensure Ruby 4.x and Bundler are available.
2. Install dependencies:

```bash
bundle install
```

3. Create and seed the database:

```bash
bin/rails db:setup
```

4. Start the app:

```bash
bin/rails server
```

Then open [http://localhost:3000](http://localhost:3000).

## Admin demo credentials

The admin section uses HTTP Basic Auth.

- Username: `admin`
- Password: `launchboard-demo`

You can override these with environment variables:

```bash
export ADMIN_USERNAME=myuser
export ADMIN_PASSWORD=mypassword
```

## Running tests

```bash
bin/rails test
```

## Notes for a job application

This app is intentionally small, but it shows the Rails fundamentals that matter in a junior-to-mid-level portfolio project:

- Active Record associations and validations
- Clean REST routes
- Server-rendered forms
- Namespaced admin controllers
- Seeded demo data
- Request and model tests

## Next improvements

- Authentication for real multi-user accounts
- Pagination for larger job lists
- Richer application review workflow
- File uploads for resumes
- Deploy to Render, Fly.io, or Heroku-style hosting

## Portfolio and verification

The Rails application includes controller tests and fixtures for companies, jobs and applications. Run `bin/rails test` in a configured local environment. Replace the documented demo credentials before exposing any administrative interface publicly; test results and production readiness are not asserted here.
