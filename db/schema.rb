# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160115200636) do

  create_table "documents", force: :cascade do |t|
    t.string   "name"
    t.boolean  "approved",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "first_steps", force: :cascade do |t|
    t.string   "letter_of_presentation"
    t.string   "payment_proof"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                   default: "",    null: false
    t.string   "password_digest"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "suffix"
    t.string   "middle_name"
    t.string   "phone_number"
    t.string   "other_number"
    t.string   "driver_license"
    t.string   "social_security"
    t.date     "dob"
    t.string   "registration_ip"
    t.string   "home_address"
    t.string   "city"
    t.integer  "zipcode"
    t.string   "time_at_address_months"
    t.string   "time_at_address_years"
    t.string   "residence_type"
    t.string   "household_payment"
    t.string   "state"
    t.string   "employer_name"
    t.string   "occupation"
    t.string   "employment_address"
    t.string   "employment_state"
    t.string   "employment_city"
    t.string   "employment_zipcode"
    t.string   "employment_phone"
    t.string   "employment_gross_income"
    t.string   "employment_years"
    t.string   "employment_months"
    t.string   "credit_login"
    t.string   "credit_password"
    t.string   "credit_security_answer"
    t.date     "credit_mother_dob"
    t.string   "referred_by"
    t.boolean  "approved",                default: false
    t.boolean  "admin",                   default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
