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

ActiveRecord::Schema.define(version: 20160406191018) do

  create_table "competencies", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "name",          limit: 255
    t.string   "proficiency",   limit: 255
    t.string   "type",          limit: 255
    t.integer  "competency_id", limit: 4
  end

  add_index "competencies", ["competency_id"], name: "index_competencies_on_competency_id", using: :btree

  create_table "competencies_tags", force: :cascade do |t|
    t.integer "competency_id", limit: 4
    t.integer "tag_id",        limit: 4
  end

  add_index "competencies_tags", ["competency_id"], name: "index_competencies_tags_on_competency_id", using: :btree
  add_index "competencies_tags", ["tag_id"], name: "index_competencies_tags_on_tag_id", using: :btree

  create_table "learning_sources", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "competency_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "learning_sources", ["competency_id"], name: "index_learning_sources_on_competency_id", using: :btree

  create_table "postrequisites_prerequisites", force: :cascade do |t|
    t.integer "postreq_id", limit: 4
    t.integer "prereq_id",  limit: 4
  end

  add_index "postrequisites_prerequisites", ["postreq_id", "prereq_id"], name: "index_postrequisites_prerequisites_on_postreq_id_and_prereq_id", unique: true, using: :btree
  add_index "postrequisites_prerequisites", ["prereq_id", "postreq_id"], name: "index_postrequisites_prerequisites_on_prereq_id_and_postreq_id", unique: true, using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_competencies", force: :cascade do |t|
    t.integer  "competency_id", limit: 4
    t.integer  "user_id",       limit: 4
    t.integer  "assessor_id",   limit: 4
    t.integer  "assessed_id",   limit: 4
    t.string   "level",         limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "user_competencies", ["competency_id"], name: "index_user_competencies_on_competency_id", using: :btree
  add_index "user_competencies", ["user_id"], name: "index_user_competencies_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",         limit: 255
    t.string   "uid",              limit: 255
    t.string   "name",             limit: 255
    t.string   "oauth_token",      limit: 255
    t.datetime "oauth_expires_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

end
