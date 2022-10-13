# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_10_03_195349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alumni", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "bio"
    t.string "job_title"
    t.bigint "job_category_id", default: 1, null: false
    t.string "employer"
    t.text "availability"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_category_id"], name: "index_alumni_on_job_category_id"
    t.index ["user_id"], name: "index_alumni_on_user_id"
  end

  create_table "event_attendees", force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "job_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "majors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "media_handles", force: :cascade do |t|
    t.bigint "alumnus_id", null: false
    t.string "platform"
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["alumnus_id"], name: "index_media_handles_on_alumnus_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "searches", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "major"
    t.integer "graduation_year"
    t.string "job_title"
    t.string "employer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.bigint "role_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.bigint "major_id"
    t.integer "graduation_year"
    t.string "phone"
    t.boolean "is_approved", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["major_id"], name: "index_users_on_major_id"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "alumni", "job_categories"
  add_foreign_key "alumni", "users"
  add_foreign_key "media_handles", "alumni"
  add_foreign_key "users", "majors"
  add_foreign_key "users", "roles"
end
