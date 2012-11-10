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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121110154341) do

  create_table "addresses", :force => true do |t|
    t.string   "address"
    t.integer  "number"
    t.string   "complement"
    t.string   "zipcode"
    t.integer  "country"
    t.string   "city"
    t.string   "neighborhood"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "clients", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "course_type"
    t.text     "description"
    t.boolean  "active",      :default => true
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "instalments", :force => true do |t|
    t.integer  "release_id"
    t.integer  "number"
    t.datetime "expiration_date"
    t.datetime "paid_at"
    t.decimal  "amount"
    t.decimal  "amount_paid"
    t.integer  "status_id"
    t.integer  "payment_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "interesteds", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.integer  "situation"
    t.text     "interest"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "rg"
    t.text     "observations"
    t.boolean  "active"
    t.integer  "address_id"
    t.string   "type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "providers", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "releases", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "category_id"
    t.decimal  "total_amount"
    t.integer  "number_instalments"
    t.boolean  "first_paid"
    t.boolean  "fixed_payment"
    t.text     "description"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "students", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "cpf"
    t.string   "rg"
    t.string   "birth_date"
    t.string   "occupation"
    t.string   "sex"
    t.string   "schooling"
    t.integer  "relationship_elderly"
    t.string   "phone"
    t.string   "cellphone"
    t.string   "street"
    t.string   "number"
    t.string   "complement"
    t.string   "neighborhood"
    t.string   "city"
    t.integer  "country"
    t.string   "zipcode"
    t.text     "notes"
    t.boolean  "rg_delivered",         :default => false
    t.boolean  "cpf_delivered",        :default => false
    t.boolean  "photo_delivered",      :default => false
    t.boolean  "cv_delivered",         :default => false
    t.boolean  "address_delivered",    :default => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "course_id"
    t.integer  "season"
    t.integer  "limit"
    t.decimal  "price"
    t.integer  "class_length"
    t.string   "workload"
    t.text     "note"
    t.integer  "status"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
