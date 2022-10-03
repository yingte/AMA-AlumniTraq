class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.string :first_name
      t.string :last_name
      t.string :major
      t.integer :graduation_year
      t.string :job_title
      t.string :employer

      t.timestamps
    end
  end
end
