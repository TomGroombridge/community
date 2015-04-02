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

ActiveRecord::Schema.define(version: 20150402095910) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_addresses", force: true do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "county"
    t.string   "postcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
    t.float    "longitude"
    t.float    "latitude"
  end

  create_table "course_dates", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
    t.integer  "quantity"
    t.boolean  "active",     default: true
    t.date     "start_date"
    t.time     "start_time"
    t.date     "end_date"
    t.time     "end_time"
    t.integer  "user_id"
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "blurb"
    t.float    "price"
    t.text     "what_to_wear"
    t.text     "what_to_bring"
    t.text     "experience"
    t.string   "avatar"
    t.string   "category"
  end

  create_table "payments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
    t.string   "email"
    t.integer  "user_id"
    t.string   "stripe_customer_token"
    t.integer  "course_date_id"
    t.string   "full_name"
    t.string   "mobile_number"
    t.text     "special_request"
    t.integer  "quantity"
  end

  create_table "plans", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "processed_payments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", force: true do |t|
    t.integer  "plan_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stripe_customer_token"
    t.integer  "user_id"
  end

  create_table "tickets", force: true do |t|
    t.string   "name"
    t.float    "price"
    t.integer  "course_date_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contact_number"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "description"
    t.string   "company_name"
    t.boolean  "subscription_added",     default: false
    t.string   "company_website"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "google"
    t.string   "pinterest"
    t.boolean  "admin",                  default: false
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
