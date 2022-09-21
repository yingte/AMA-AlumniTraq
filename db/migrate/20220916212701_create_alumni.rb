class CreateAlumni < ActiveRecord::Migration[6.1]
  def change
    create_table :alumni do |t|
      t.references :user, null: false, foreign_key: true
      t.text :bio
      t.string :job_title
      t.string :employer
      t.text :availability

      t.timestamps
    end
  end
end
