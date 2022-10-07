class CreateCalendarevents < ActiveRecord::Migration[6.1]
  def change
    create_table :calendarevents do |t|
      t.string :title
      t.integer :calendar_id
      t.datetime :start
      t.datetime :end
      t.string :location

      t.timestamps
    end
  end
end
