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

ActiveRecord::Schema.define(version: 20170210192859) do

  create_table "address_types", force: :cascade do |t|
    t.string   "name",        limit: 50
    t.string   "description", limit: 100
    t.integer  "status_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["status_id"], name: "index_address_types_on_status_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.integer  "address_type_id"
    t.integer  "employee_id"
    t.string   "address1",        limit: 200
    t.string   "address2",        limit: 200
    t.string   "city",            limit: 100
    t.string   "state",           limit: 50
    t.string   "zip_code",        limit: 10
    t.integer  "status_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["address_type_id"], name: "index_addresses_on_address_type_id"
    t.index ["employee_id"], name: "index_addresses_on_employee_id"
    t.index ["status_id"], name: "index_addresses_on_status_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name",        limit: 50
    t.string   "description", limit: 100
    t.integer  "status_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["status_id"], name: "index_departments_on_status_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string   "first_name",    limit: 200
    t.string   "last_name",     limit: 200
    t.integer  "department_id"
    t.integer  "position_id"
    t.integer  "status_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["position_id"], name: "index_employees_on_position_id"
    t.index ["status_id"], name: "index_employees_on_status_id"
  end

  create_table "phone_types", force: :cascade do |t|
    t.string   "name",        limit: 50
    t.string   "description", limit: 100
    t.integer  "status_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["status_id"], name: "index_phone_types_on_status_id"
  end

  create_table "phones", force: :cascade do |t|
    t.integer  "phone_type_id"
    t.integer  "employee_id"
    t.string   "phone",         limit: 20
    t.integer  "status_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["employee_id"], name: "index_phones_on_employee_id"
    t.index ["phone_type_id"], name: "index_phones_on_phone_type_id"
    t.index ["status_id"], name: "index_phones_on_status_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name",        limit: 50
    t.string   "description", limit: 100
    t.integer  "status_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["status_id"], name: "index_positions_on_status_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "name",        limit: 50
    t.string   "description", limit: 200
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

end
