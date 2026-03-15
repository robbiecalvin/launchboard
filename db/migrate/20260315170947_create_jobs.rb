class CreateJobs < ActiveRecord::Migration[7.2]
  def change
    create_table :jobs do |t|
      t.references :company, null: false, foreign_key: true
      t.string :title, null: false
      t.string :location, null: false
      t.string :employment_type, null: false
      t.string :salary_range
      t.integer :status, null: false, default: 1
      t.boolean :remote, null: false, default: false
      t.text :summary, null: false
      t.text :description, null: false
      t.boolean :featured, null: false, default: false
      t.date :posted_on

      t.timestamps
    end

    add_index :jobs, :status
    add_index :jobs, :featured
    add_index :jobs, :posted_on
  end
end
