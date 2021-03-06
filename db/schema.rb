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

ActiveRecord::Schema.define(:version => 20110315164456) do

  create_table "certification_marks", :force => true do |t|
    t.integer  "certification_id"
    t.integer  "user_id"
    t.integer  "skill_id"
    t.integer  "mark"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "certification_marks", ["certification_id"], :name => "index_certification_marks_on_certification_id"
  add_index "certification_marks", ["skill_id"], :name => "index_certification_marks_on_skill_id"
  add_index "certification_marks", ["user_id"], :name => "index_certification_marks_on_user_id"

  create_table "certifications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "position_id"
    t.datetime "finished_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "result"
  end

  add_index "certifications", ["position_id"], :name => "index_certifications_on_position_id"
  add_index "certifications", ["user_id"], :name => "index_certifications_on_user_id"

  create_table "certifications_experts", :id => false, :force => true do |t|
    t.integer "certification_id"
    t.integer "user_id"
  end

  add_index "certifications_experts", ["certification_id", "user_id"], :name => "index_certifications_experts_on_certification_id_and_user_id"
  add_index "certifications_experts", ["user_id", "certification_id"], :name => "index_certifications_experts_on_user_id_and_certification_id"

  create_table "positions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id", "user_id"], :name => "index_roles_users_on_role_id_and_user_id"
  add_index "roles_users", ["user_id", "role_id"], :name => "index_roles_users_on_user_id_and_role_id"

  create_table "skill_types", :force => true do |t|
    t.string   "name"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", :force => true do |t|
    t.integer  "position_id"
    t.integer  "skill_type_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["position_id"], :name => "index_skills_on_position_id"
  add_index "skills", ["skill_type_id"], :name => "index_skills_on_skill_type_id"

  create_table "user_identities", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_identities", ["user_id"], :name => "index_user_identities_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
