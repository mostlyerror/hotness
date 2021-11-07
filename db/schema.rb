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

ActiveRecord::Schema.define(version: 2021_11_07_070417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "fuzzystrmatch"
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.bigint "hotel_id", null: false
    t.bigint "swap_id", null: false
    t.date "date", null: false
    t.integer "vacant"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.jsonb "log_data"
    t.index ["hotel_id", "swap_id", "date"], name: "index_availabilities_on_hotel_id_and_swap_id_and_date", unique: true
    t.index ["hotel_id"], name: "index_availabilities_on_hotel_id"
    t.index ["swap_id"], name: "index_availabilities_on_swap_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "date_of_birth"
    t.string "gender"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ethnicity"
    t.string "email"
    t.string "phone_number"
    t.jsonb "race", default: []
    t.boolean "veteran"
    t.string "veteran_military_branch"
    t.string "veteran_separation_year"
    t.string "veteran_discharge_status"
    t.jsonb "family_members", default: {}
    t.boolean "banned", default: false
    t.boolean "force_intake", default: false
    t.jsonb "log_data"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.string "title"
    t.string "preferred_contact_method"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.jsonb "log_data"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name", null: false
    t.json "address"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "pet_friendly", default: false
    t.boolean "active", default: true
    t.jsonb "log_data"
  end

  create_table "hotels_contacts", force: :cascade do |t|
    t.bigint "hotel_id"
    t.bigint "contact_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.jsonb "log_data"
    t.index ["contact_id"], name: "index_hotels_contacts_on_contact_id"
    t.index ["hotel_id", "contact_id"], name: "index_hotels_contacts_on_hotel_id_and_contact_id", unique: true
    t.index ["hotel_id"], name: "index_hotels_contacts_on_hotel_id"
  end

  create_table "hotels_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "hotel_id", null: false
    t.jsonb "log_data"
    t.index ["hotel_id"], name: "index_hotels_users_on_hotel_id"
    t.index ["user_id"], name: "index_hotels_users_on_user_id"
  end

  create_table "incident_reports", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.text "description"
    t.datetime "occurred_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "reporter_id"
    t.integer "hotel_id"
    t.boolean "red_flag", default: false
    t.jsonb "log_data"
    t.index ["client_id"], name: "index_incident_reports_on_client_id"
    t.index ["reporter_id"], name: "index_incident_reports_on_reporter_id"
  end

  create_table "intakes", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "homelessness_first_time"
    t.string "homelessness_how_long_this_time"
    t.boolean "episodes_last_three_years_fewer_than_four_times"
    t.string "total_how_long_shelters_or_streets"
    t.string "are_you_working"
    t.boolean "armed_forces"
    t.boolean "active_duty"
    t.boolean "substance_abuse"
    t.boolean "chronic_health_condition"
    t.boolean "mental_health_condition"
    t.boolean "mental_health_disability"
    t.boolean "physical_disability"
    t.boolean "developmental_disability"
    t.boolean "fleeing_domestic_violence"
    t.string "last_permanent_residence_county"
    t.string "substance_misuse"
    t.string "homelessness_total_last_three_years"
    t.boolean "have_you_ever_experienced_homelessness_before"
    t.string "health_insurance"
    t.jsonb "non_cash_benefits", default: []
    t.string "homelessness_episodes_last_three_years"
    t.boolean "income_source_any"
    t.integer "income_source_earned_income"
    t.integer "income_source_ssdi"
    t.integer "income_source_ssi"
    t.integer "income_source_unemployment_insurance"
    t.integer "income_source_tanf"
    t.integer "income_source_child_support"
    t.integer "income_source_retirement"
    t.integer "income_source_alimony"
    t.integer "income_source_veteran_service_compensation"
    t.integer "income_source_general_assistance"
    t.date "homelessness_date_began"
    t.boolean "household_tanf"
    t.jsonb "log_data"
    t.index ["client_id"], name: "index_intakes_on_client_id"
    t.index ["user_id"], name: "index_intakes_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "red_flags", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "hotel_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.jsonb "log_data"
    t.index ["client_id"], name: "index_red_flags_on_client_id"
    t.index ["hotel_id"], name: "index_red_flags_on_hotel_id"
  end

  create_table "short_intakes", force: :cascade do |t|
    t.string "where_did_you_sleep_last_night"
    t.string "what_city_did_you_sleep_in_last_night"
    t.string "why_not_shelter", default: [], array: true
    t.boolean "bus_pass"
    t.boolean "king_soopers_card"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "client_id", null: false
    t.bigint "user_id", null: false
    t.boolean "household_composition_changed"
    t.jsonb "log_data"
    t.index ["client_id"], name: "index_short_intakes_on_client_id"
    t.index ["user_id"], name: "index_short_intakes_on_user_id"
  end

  create_table "swaps", force: :cascade do |t|
    t.date "start_date", null: false
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "intake_dates", default: [], array: true
    t.jsonb "log_data"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin_user", default: false, null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.boolean "hotel_user", default: false, null: false
    t.boolean "intake_user", default: false, null: false
    t.boolean "show_swap_panel", default: true
    t.boolean "active", default: true
    t.jsonb "log_data"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vouchers", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "user_id", null: false
    t.bigint "hotel_id", null: false
    t.date "check_in", null: false
    t.date "check_out", null: false
    t.string "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "swap_id"
    t.integer "num_adults_in_household"
    t.integer "num_children_in_household"
    t.integer "guest_ids", default: [], array: true
    t.text "notes"
    t.jsonb "log_data"
    t.index ["client_id", "swap_id"], name: "index_vouchers_on_client_id_and_swap_id"
    t.index ["client_id"], name: "index_vouchers_on_client_id"
    t.index ["hotel_id"], name: "index_vouchers_on_hotel_id"
    t.index ["swap_id"], name: "index_vouchers_on_swap_id"
    t.index ["user_id"], name: "index_vouchers_on_user_id"
  end

  add_foreign_key "availabilities", "hotels"
  add_foreign_key "availabilities", "swaps"
  add_foreign_key "incident_reports", "clients"
  add_foreign_key "incident_reports", "users", column: "reporter_id"
  add_foreign_key "intakes", "clients"
  add_foreign_key "intakes", "users"
  add_foreign_key "red_flags", "clients"
  add_foreign_key "red_flags", "hotels"
  add_foreign_key "short_intakes", "clients"
  add_foreign_key "short_intakes", "users"
  add_foreign_key "vouchers", "clients"
  add_foreign_key "vouchers", "hotels"
  add_foreign_key "vouchers", "swaps"
  add_foreign_key "vouchers", "users"
end
