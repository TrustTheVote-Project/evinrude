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

ActiveRecord::Schema.define(version: 20161201220352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "voter_record_imports", force: :cascade do |t|
    t.string   "filename"
    t.integer  "record_count"
    t.boolean  "valid_file"
    t.string   "state_abbr"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "voter_registrations", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "ssn"
    t.string   "date_of_birth"
    t.string   "phone"
    t.string   "race"
    t.string   "sex"
    t.string   "party"
    t.string   "voter_id_type"
    t.string   "voter_id_value"
    t.string   "registration_address"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

end
