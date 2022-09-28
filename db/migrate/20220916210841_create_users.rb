class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest
      t.references :role, null: false, foreign_key: true, :on_delete => :cascade
      t.string :first_name
      t.string :last_name
      t.string :major
      t.integer :graduation_year
      t.string :phone

      t.timestamps
    end
  end
end
