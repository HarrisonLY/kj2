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

ActiveRecord::Schema.define(version: 20141126023540) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorizations", force: true do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id"
  add_index "categorizations", ["product_id"], name: "index_categorizations_on_product_id"

  create_table "clocks", force: true do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clocks", ["product_id"], name: "index_clocks_on_product_id"
  add_index "clocks", ["user_id"], name: "index_clocks_on_user_id"

  create_table "contacts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "releasing_on"
    t.string   "website"
    t.string   "image_file_name"
    t.string   "industry"
    t.string   "slug"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "company"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "picture1_file_name"
    t.string   "picture1_content_type"
    t.integer  "picture1_file_size"
    t.datetime "picture1_updated_at"
    t.string   "picture2_file_name"
    t.string   "picture2_content_type"
    t.integer  "picture2_file_size"
    t.datetime "picture2_updated_at"
    t.string   "picture3_file_name"
    t.string   "picture3_content_type"
    t.integer  "picture3_file_size"
    t.datetime "picture3_updated_at"
    t.string   "picture4_file_name"
    t.string   "picture4_content_type"
    t.integer  "picture4_file_size"
    t.datetime "picture4_updated_at"
    t.string   "picture5_file_name"
    t.string   "picture5_content_type"
    t.integer  "picture5_file_size"
    t.datetime "picture5_updated_at"
    t.string   "picture6_file_name"
    t.string   "picture6_content_type"
    t.integer  "picture6_file_size"
    t.datetime "picture6_updated_at"
    t.string   "picture7_file_name"
    t.string   "picture7_content_type"
    t.integer  "picture7_file_size"
    t.datetime "picture7_updated_at"
    t.string   "picture8_file_name"
    t.string   "picture8_content_type"
    t.integer  "picture8_file_size"
    t.datetime "picture8_updated_at"
    t.string   "picture9_file_name"
    t.string   "picture9_content_type"
    t.integer  "picture9_file_size"
    t.datetime "picture9_updated_at"
  end

# Could not dump table "users" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
