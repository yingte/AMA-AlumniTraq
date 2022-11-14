# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.references :role, default: 2, foreign_key: true, on_delete: :cascade
      t.string :first_name
      t.string :last_name
      t.references :major, optional: true, foreign_key: true, on_delete: :nullify
      t.integer :graduation_year, default: 1876
      t.string :phone
      t.boolean :is_approved, default: false

      t.timestamps
    end
  end
end
