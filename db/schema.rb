# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_05_22_210041) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accomodations", force: :cascade do |t|
    t.string "address"
    t.string "kind"
    t.string "name"
    t.string "e_mail"
    t.string "phone_number"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diaries", force: :cascade do |t|
    t.date "date"
    t.text "description"
    t.string "tittle"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_diaries_on_trip_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer "photo"
    t.bigint "diary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diary_id"], name: "index_photos_on_diary_id"
  end

  create_table "stays", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.bigint "trip_id"
    t.bigint "accomodation_id"
    t.string "reservation_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accomodation_id"], name: "index_stays_on_accomodation_id"
    t.index ["trip_id"], name: "index_stays_on_trip_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "tittle"
    t.text "description"
    t.boolean "done"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_tasks_on_trip_id"
  end

  create_table "travels", force: :cascade do |t|
    t.string "reservation_number"
    t.string "mode"
    t.date "start_date"
    t.date "end_date"
    t.bigint "trip_id"
    t.string "compagny_name"
    t.string "ticket_file"
    t.string "address_in"
    t.string "address_out"
    t.float "latitude"
    t.float "longitude"
    t.time "start_date_time"
    t.time "end_date_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_travels_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "tittle"
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "diaries", "trips"
  add_foreign_key "photos", "diaries"
  add_foreign_key "stays", "accomodations"
  add_foreign_key "stays", "trips"
  add_foreign_key "tasks", "trips"
  add_foreign_key "travels", "trips"
  add_foreign_key "trips", "users"
end
