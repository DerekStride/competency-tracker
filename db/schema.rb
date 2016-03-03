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

ActiveRecord::Schema.define(version: 20160303220817) do

  create_table "competencies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "postrequisites_prerequisites", id: false, force: :cascade do |t|
    t.integer "postreq_id"
    t.integer "prereq_id"
  end

  add_index "postrequisites_prerequisites", ["postreq_id", "prereq_id"], name: "index_postrequisites_prerequisites_on_postreq_id_and_prereq_id", unique: true
  add_index "postrequisites_prerequisites", ["prereq_id", "postreq_id"], name: "index_postrequisites_prerequisites_on_prereq_id_and_postreq_id", unique: true

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.integer  "competency_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "topics", ["competency_id"], name: "index_topics_on_competency_id"

end
