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
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.string   "proficiency"
    t.string   "type"
    t.integer  "competency_id"
  end

  add_index "competencies", ["competency_id"], name: "index_competencies_on_competency_id"

  create_table "competencies_tags", force: :cascade do |t|
    t.integer "competency_id"
    t.integer "tag_id"
  end

  add_index "competencies_tags", ["competency_id"], name: "index_competencies_tags_on_competency_id"
  add_index "competencies_tags", ["tag_id"], name: "index_competencies_tags_on_tag_id"

  create_table "learning_sources", force: :cascade do |t|
    t.string   "name"
    t.integer  "competency_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "learning_sources", ["competency_id"], name: "index_learning_sources_on_competency_id"

  create_table "postrequisites_prerequisites", force: :cascade do |t|
    t.integer "postreq_id"
    t.integer "prereq_id"
  end

  add_index "postrequisites_prerequisites", ["postreq_id", "prereq_id"], name: "index_postrequisites_prerequisites_on_postreq_id_and_prereq_id", unique: true
  add_index "postrequisites_prerequisites", ["prereq_id", "postreq_id"], name: "index_postrequisites_prerequisites_on_prereq_id_and_postreq_id", unique: true

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_competencies", force: :cascade do |t|
    t.integer  "competency_id"
    t.integer  "user_id"
    t.integer  "assessor_id"
    t.string   "level"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "user_competencies", ["competency_id"], name: "index_user_competencies_on_competency_id"
  add_index "user_competencies", ["user_id"], name: "index_user_competencies_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
