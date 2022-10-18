# frozen_string_literal: true

class CreateMeetings < ActiveRecord::Migration[6.1]
  def change
    create_table :meetings do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.text :description

      t.timestamps
    end
  end
end
