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

ActiveRecord::Schema.define(version: 20130802233933) do

  create_table "bookmarks", force: true do |t|
    t.integer  "user_id"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bookmarks", ["source_id"], name: "index_bookmarks_on_source_id"
  add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id"

  create_table "completed_sources", force: true do |t|
    t.integer  "user_id"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "completed_sources", ["source_id"], name: "index_completed_sources_on_source_id"
  add_index "completed_sources", ["user_id"], name: "index_completed_sources_on_user_id"

  create_table "learning_paths", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nodes", force: true do |t|
    t.integer  "topic_id"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "learning_path_id"
  end

  add_index "nodes", ["learning_path_id"], name: "index_nodes_on_learning_path_id"
  add_index "nodes", ["skill_id"], name: "index_nodes_on_skill_id"
  add_index "nodes", ["topic_id"], name: "index_nodes_on_topic_id"

  create_table "requirements", force: true do |t|
    t.integer "node_id"
    t.integer "source_id"
  end

  create_table "skills", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "topic_id"
    t.integer  "source_id"
  end

  add_index "skills", ["source_id"], name: "index_skills_on_source_id"
  add_index "skills", ["topic_id"], name: "index_skills_on_topic_id"

  create_table "sources", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "summary"
    t.string   "image_url"
    t.integer  "price"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
