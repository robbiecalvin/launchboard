class CreateCompanies < ActiveRecord::Migration[7.2]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.string :location, null: false
      t.string :website
      t.string :industry, null: false
      t.text :description, null: false

      t.timestamps
    end

    add_index :companies, :slug, unique: true
  end
end
