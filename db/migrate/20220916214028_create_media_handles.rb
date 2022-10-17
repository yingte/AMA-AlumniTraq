class CreateMediaHandles < ActiveRecord::Migration[6.1]
  def change
    create_table :media_handles do |t|
      t.references :alumnus, null: false, foreign_key: true
      t.string :platform
      t.string :link

      t.timestamps
    end
  end
end
