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

ActiveRecord::Schema.define(version: 20160118154646) do

  create_table "authors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "biography",  limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "authors", ["name"], name: "index_authors_on_name", using: :btree

  create_table "book_authors", force: :cascade do |t|
    t.integer  "book_id",    limit: 4
    t.integer  "author_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "book_authors", ["author_id"], name: "index_book_authors_on_author_id", using: :btree
  add_index "book_authors", ["book_id"], name: "index_book_authors_on_book_id", using: :btree

  create_table "books", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.decimal  "price",                     precision: 10
    t.integer  "in_stock",    limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_foreign_key "book_authors", "authors"
  add_foreign_key "book_authors", "books"
end
