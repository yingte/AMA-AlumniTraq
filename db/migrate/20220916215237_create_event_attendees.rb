# frozen_string_literal: true

class CreateEventAttendees < ActiveRecord::Migration[6.1]
  def change
    create_table :event_attendees do |t|
      t.integer :meeting_id
      t.integer :user_id

      t.timestamps
    end
  end
end
