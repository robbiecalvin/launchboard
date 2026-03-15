class CreateJobApplications < ActiveRecord::Migration[7.2]
  def change
    create_table :job_applications do |t|
      t.references :job, null: false, foreign_key: true
      t.string :candidate_name, null: false
      t.string :email, null: false
      t.string :portfolio_url
      t.string :resume_url
      t.text :cover_letter, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end

    add_index :job_applications, :status
    add_index :job_applications, :email
  end
end
