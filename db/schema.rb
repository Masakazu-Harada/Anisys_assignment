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

ActiveRecord::Schema[7.0].define(version: 2023_11_08_071931) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bosses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tel_number", limit: 15
    t.string "fax_number", limit: 15
    t.string "post_code", limit: 8
    t.text "address1"
    t.text "address2"
    t.integer "branch_type"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.integer "staff_number"
    t.string "full_name"
    t.string "kana_name"
    t.string "log_in_id", null: false
    t.string "password_digest", null: false
    t.integer "admin", default: 0
    t.integer "enable", default: 1
    t.string "email"
    t.datetime "pwup_day"
    t.bigint "branch_id"
    t.bigint "department_id"
    t.bigint "boss_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "login_attempts", default: 0, null: false
    t.index ["boss_id"], name: "index_employees_on_boss_id"
    t.index ["branch_id"], name: "index_employees_on_branch_id"
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["log_in_id"], name: "index_employees_on_log_in_id", unique: true
    t.index ["staff_number"], name: "index_employees_on_staff_number", unique: true
  end

  add_foreign_key "employees", "bosses"
  add_foreign_key "employees", "branches"
  add_foreign_key "employees", "departments"
end
