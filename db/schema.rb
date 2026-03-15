# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2026_03_15_170948) do
  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.string "location", null: false
    t.string "website"
    t.string "industry", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_companies_on_slug", unique: true
  end

  create_table "job_applications", force: :cascade do |t|
    t.integer "job_id", null: false
    t.string "candidate_name", null: false
    t.string "email", null: false
    t.string "portfolio_url"
    t.string "resume_url"
    t.text "cover_letter", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_job_applications_on_email"
    t.index ["job_id"], name: "index_job_applications_on_job_id"
    t.index ["status"], name: "index_job_applications_on_status"
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "company_id", null: false
    t.string "title", null: false
    t.string "location", null: false
    t.string "employment_type", null: false
    t.string "salary_range"
    t.integer "status", default: 1, null: false
    t.boolean "remote", default: false, null: false
    t.text "summary", null: false
    t.text "description", null: false
    t.boolean "featured", default: false, null: false
    t.date "posted_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_jobs_on_company_id"
    t.index ["featured"], name: "index_jobs_on_featured"
    t.index ["posted_on"], name: "index_jobs_on_posted_on"
    t.index ["status"], name: "index_jobs_on_status"
  end

  add_foreign_key "job_applications", "jobs"
  add_foreign_key "jobs", "companies"
end
