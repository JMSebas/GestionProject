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

ActiveRecord::Schema[7.2].define(version: 2024_10_28_181743) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "damages", force: :cascade do |t|
    t.bigint "rental_id", null: false
    t.text "description"
    t.decimal "repair_cost"
    t.string "status"
    t.datetime "report_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rental_id"], name: "index_damages_on_rental_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "rental_id", null: false
    t.decimal "total_amount"
    t.datetime "issue_date"
    t.date "due_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rental_id"], name: "index_invoices_on_rental_id"
  end

  create_table "maintenances", force: :cascade do |t|
    t.bigint "vehicle_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.text "description"
    t.decimal "cost"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_maintenances_on_vehicle_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "rental_id", null: false
    t.decimal "amount"
    t.date "payment_date"
    t.string "payment_method"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rental_id"], name: "index_payments_on_rental_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.bigint "reservation_id", null: false
    t.bigint "user_id", null: false
    t.datetime "actual_start_date"
    t.datetime "expected_return_date"
    t.datetime "actual_return_date"
    t.integer "initial_odometer"
    t.integer "final_odometer"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_rentals_on_reservation_id"
    t.index ["user_id"], name: "index_rentals_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "vehicle_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reservations_on_user_id"
    t.index ["vehicle_id"], name: "index_reservations_on_vehicle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.string "name"
    t.string "lastname"
    t.string "address"
    t.string "phone"
    t.date "birthdate"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.string "license_plate"
    t.integer "year"
    t.string "type"
    t.string "status"
    t.decimal "daily_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "damages", "rentals"
  add_foreign_key "invoices", "rentals"
  add_foreign_key "maintenances", "vehicles"
  add_foreign_key "payments", "rentals"
  add_foreign_key "rentals", "reservations"
  add_foreign_key "rentals", "users"
  add_foreign_key "reservations", "users"
  add_foreign_key "reservations", "vehicles"
end
