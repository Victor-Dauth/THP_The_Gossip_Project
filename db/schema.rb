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

ActiveRecord::Schema.define(version: 2020_07_18_104502) do

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gossips", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_gossips_on_user_id"
  end

  create_table "gossips_tags", id: false, force: :cascade do |t|
    t.integer "gossip_id", null: false
    t.integer "tag_id", null: false
    t.index ["gossip_id", "tag_id"], name: "index_gossips_tags_on_gossip_id_and_tag_id"
    t.index ["tag_id", "gossip_id"], name: "index_gossips_tags_on_tag_id_and_gossip_id"
  end

  create_table "private_messages", force: :cascade do |t|
    t.text "content"
    t.integer "sender_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sender_id"], name: "index_private_messages_on_sender_id"
  end

  create_table "r_messages_recipients", id: false, force: :cascade do |t|
    t.integer "recipient_id", null: false
    t.integer "r_message_id", null: false
    t.index [nil, nil], name: "index_r_messages_recipients_on_r_messages_id_and_recipients_id"
    t.index [nil, nil], name: "index_r_messages_recipients_on_recipients_id_and_r_messages_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.string "email"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "city_id"
    t.index ["city_id"], name: "index_users_on_city_id"
  end

end