# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100712021020) do

  create_table "admins", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["confirmation_token"], :name => "index_admins_on_confirmation_token", :unique => true
  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "applicants", :force => true do |t|
    t.integer  "program_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address"
    t.string   "city"
    t.string   "zip"
    t.string   "phone"
    t.string   "email"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jurors", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jurors", ["confirmation_token"], :name => "index_jurors_on_confirmation_token", :unique => true
  add_index "jurors", ["email"], :name => "index_jurors_on_email", :unique => true
  add_index "jurors", ["reset_password_token"], :name => "index_jurors_on_reset_password_token", :unique => true

  create_table "programs", :force => true do |t|
    t.string   "title"
    t.text     "guidlines"
    t.text     "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.date     "start"
    t.date     "end"
    t.text     "description"
    t.string   "url"
  end

  create_table "submissions", :force => true do |t|
    t.integer  "applicant_id"
    t.text     "statement"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "works", :force => true do |t|
    t.integer  "submission_id"
    t.integer  "type_id"
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

end
