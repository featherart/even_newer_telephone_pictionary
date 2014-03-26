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

ActiveRecord::Schema.define(:version => 20140203235240) do

  create_table "phrases", :force => true do |t|
    t.string   "text"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "storyline_id"
    t.integer  "user_id"
  end

  create_table "pictures", :force => true do |t|
    t.text     "image"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "storyline_id"
    t.integer  "user_id"
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "phone_number"
  end

  create_table "storylines", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.datetime "time_stop"
    t.boolean  "active"
    t.string   "story_name"
    t.integer  "num_players"
  end

  create_table "turns", :force => true do |t|
    t.integer  "turn_number"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "turn_number"
    t.integer  "storyline_id"
  end

end
