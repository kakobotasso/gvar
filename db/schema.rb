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

ActiveRecord::Schema.define(:version => 20121204013149) do

  create_table "activities", :force => true do |t|
    t.string   "timetable"
    t.text     "description"
    t.integer  "meeting_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "activities", ["meeting_id"], :name => "index_activities_on_meeting_id"
  add_index "activities", ["timetable"], :name => "index_activities_on_timetable"
  add_index "activities", ["updated_at"], :name => "index_activities_on_updated_at"

  create_table "addresses", :force => true do |t|
    t.string   "address"
    t.integer  "number"
    t.integer  "person_id"
    t.string   "complement"
    t.string   "zipcode"
    t.integer  "country_id"
    t.string   "city"
    t.string   "neighborhood"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "addresses", ["address"], :name => "index_addresses_on_address"
  add_index "addresses", ["country_id"], :name => "index_addresses_on_country_id"
  add_index "addresses", ["person_id"], :name => "index_addresses_on_person_id"
  add_index "addresses", ["updated_at"], :name => "index_addresses_on_updated_at"

  create_table "courses", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "course_type"
    t.text     "description"
    t.boolean  "active",      :default => true
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "courses", ["code"], :name => "index_courses_on_code"
  add_index "courses", ["name"], :name => "index_courses_on_name"
  add_index "courses", ["updated_at"], :name => "index_courses_on_updated_at"

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

  add_index "instalments", ["expiration_date"], :name => "index_instalments_on_expiration_date"
  add_index "instalments", ["release_id"], :name => "index_instalments_on_release_id"
  add_index "instalments", ["updated_at"], :name => "index_instalments_on_updated_at"

  create_table "interested_contacts", :force => true do |t|
    t.string   "date"
    t.text     "description"
    t.integer  "interested_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "interested_contacts", ["date"], :name => "index_interested_contacts_on_date"
  add_index "interested_contacts", ["interested_id"], :name => "index_interested_contacts_on_interested_id"
  add_index "interested_contacts", ["updated_at"], :name => "index_interested_contacts_on_updated_at"

  create_table "interesteds", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.integer  "situation"
    t.text     "interest"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "interesteds", ["email"], :name => "index_interesteds_on_email"
  add_index "interesteds", ["name"], :name => "index_interesteds_on_name"
  add_index "interesteds", ["updated_at"], :name => "index_interesteds_on_updated_at"

  create_table "meetings", :force => true do |t|
    t.date     "date"
    t.integer  "team_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "meetings", ["date"], :name => "index_meetings_on_date"
  add_index "meetings", ["team_id"], :name => "index_meetings_on_team_id"
  add_index "meetings", ["updated_at"], :name => "index_meetings_on_updated_at"

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "rg"
    t.text     "observations"
    t.boolean  "active"
    t.string   "type"
    t.string   "birth_date"
    t.string   "occupation"
    t.integer  "sex"
    t.string   "schooling"
    t.integer  "relationship_elderly"
    t.text     "notes"
    t.boolean  "rg_delivered",         :default => false
    t.boolean  "cpf_delivered",        :default => false
    t.boolean  "photo_delivered",      :default => false
    t.boolean  "cv_delivered",         :default => false
    t.boolean  "address_delivered",    :default => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "people", ["birth_date"], :name => "index_people_on_birth_date"
  add_index "people", ["cpf"], :name => "index_people_on_cpf"
  add_index "people", ["name"], :name => "index_people_on_name"
  add_index "people", ["rg"], :name => "index_people_on_rg"
  add_index "people", ["type"], :name => "index_people_on_type"
  add_index "people", ["updated_at"], :name => "index_people_on_updated_at"

  create_table "phones", :force => true do |t|
    t.integer  "type_number"
    t.string   "number"
    t.integer  "person_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "phones", ["number"], :name => "index_phones_on_number"
  add_index "phones", ["person_id"], :name => "index_phones_on_person_id"
  add_index "phones", ["updated_at"], :name => "index_phones_on_updated_at"

  create_table "providers_services", :id => false, :force => true do |t|
    t.integer "provider_id"
    t.integer "service_id"
  end

  create_table "registrations", :force => true do |t|
    t.string   "code"
    t.integer  "team_id"
    t.integer  "student_id"
    t.integer  "release_id"
    t.integer  "status",     :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "registrations", ["code"], :name => "index_registrations_on_code"
  add_index "registrations", ["release_id"], :name => "index_registrations_on_release_id"
  add_index "registrations", ["student_id"], :name => "index_registrations_on_student_id"
  add_index "registrations", ["team_id"], :name => "index_registrations_on_team_id"
  add_index "registrations", ["updated_at"], :name => "index_registrations_on_updated_at"

  create_table "releases", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "category_id"
    t.decimal  "total_amount"
    t.integer  "number_instalments"
    t.boolean  "first_paid"
    t.boolean  "fixed_payment"
    t.text     "description"
    t.string   "type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "releases", ["code"], :name => "index_releases_on_code"
  add_index "releases", ["type"], :name => "index_releases_on_type"
  add_index "releases", ["updated_at"], :name => "index_releases_on_updated_at"

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "schedules", :force => true do |t|
    t.string   "code"
    t.integer  "service_id"
    t.integer  "provider_id"
    t.integer  "client_id"
    t.integer  "release_id"
    t.string   "estimated_time"
    t.integer  "number_days"
    t.datetime "date"
    t.text     "observations"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "schedules", ["client_id"], :name => "index_schedules_on_client_id"
  add_index "schedules", ["code"], :name => "index_schedules_on_code"
  add_index "schedules", ["date"], :name => "index_schedules_on_date"
  add_index "schedules", ["provider_id"], :name => "index_schedules_on_provider_id"
  add_index "schedules", ["release_id"], :name => "index_schedules_on_release_id"
  add_index "schedules", ["service_id"], :name => "index_schedules_on_service_id"
  add_index "schedules", ["updated_at"], :name => "index_schedules_on_updated_at"

  create_table "services", :force => true do |t|
    t.string   "name"
    t.integer  "number_days"
    t.string   "estimated_time"
    t.decimal  "default_value"
    t.boolean  "inactive"
    t.text     "description"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "services", ["name"], :name => "index_services_on_name"
  add_index "services", ["updated_at"], :name => "index_services_on_updated_at"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

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

  add_index "teams", ["code"], :name => "index_teams_on_code"
  add_index "teams", ["course_id"], :name => "index_teams_on_course_id"
  add_index "teams", ["season"], :name => "index_teams_on_season"
  add_index "teams", ["updated_at"], :name => "index_teams_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["updated_at"], :name => "index_users_on_updated_at"

end
