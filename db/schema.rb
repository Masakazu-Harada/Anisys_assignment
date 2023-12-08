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

ActiveRecord::Schema[7.0].define(version: 2023_12_07_075415) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "branch_type", default: 0
    t.string "tel_number", limit: 15
    t.string "fax_number", limit: 15
    t.string "post_code", limit: 8
    t.text "address1"
    t.text "address2"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_roles", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employee_roles_on_employee_id"
    t.index ["role_id"], name: "index_employee_roles_on_role_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "full_name", limit: 20, null: false
    t.string "kana_name", limit: 20, null: false
    t.string "log_in_id", null: false
    t.string "password_digest", null: false
    t.integer "enable", default: 1
    t.string "email", null: false
    t.datetime "pwup_day"
    t.bigint "branch_id", null: false
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "login_attempts", default: 0, null: false
    t.integer "boss_id"
    t.integer "position", default: 0, null: false
    t.bigint "role_id"
    t.index ["branch_id"], name: "index_employees_on_branch_id"
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["log_in_id"], name: "index_employees_on_log_in_id", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_schedules", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.date "date", null: false
    t.string "start_time"
    t.string "end_time"
    t.string "break_time"
    t.string "over_time"
    t.integer "total_work_days"
    t.integer "absent_days"
    t.integer "paid_leave_days"
    t.string "total_work_hours"
    t.string "total_overtime_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attendance_status"
    t.string "actual_work_hours"
    t.index ["employee_id"], name: "index_work_schedules_on_employee_id"
  end

  add_foreign_key "employee_roles", "employees"
  add_foreign_key "employee_roles", "roles"
  add_foreign_key "employees", "branches"
  add_foreign_key "employees", "departments"
  add_foreign_key "work_schedules", "employees"
end
