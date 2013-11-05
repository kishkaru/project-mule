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

ActiveRecord::Schema.define(:version => 20131105222523) do

  create_table "delivery_areas", :force => true do |t|
    t.string   "name"
    t.integer  "server_id"
    t.integer  "menu_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "delivery_areas", ["menu_id"], :name => "index_delivery_areas_on_menu_id"
  add_index "delivery_areas", ["server_id"], :name => "index_delivery_areas_on_server_id"

  create_table "delivery_points", :force => true do |t|
    t.string   "address"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "customer_id"
    t.integer  "delivery_area_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "delivery_points", ["customer_id"], :name => "index_delivery_points_on_customer_id"
  add_index "delivery_points", ["delivery_area_id"], :name => "index_delivery_points_on_delivery_area_id"

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ingredients_items", :id => false, :force => true do |t|
    t.integer "ingredient_id"
    t.integer "item_id"
  end

  add_index "ingredients_items", ["ingredient_id"], :name => "index_ingredients_items_on_ingredient_id"
  add_index "ingredients_items", ["item_id", "ingredient_id"], :name => "index_ingredients_items_on_item_id_and_ingredient_id"

  create_table "items", :force => true do |t|
    t.string   "name"
    t.float    "price"
    t.text     "description"
    t.integer  "quantity"
    t.datetime "expires_at"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "menu_id"
    t.integer  "vendor_id"
  end

  create_table "menus", :force => true do |t|
    t.datetime "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "phone_numbers", :force => true do |t|
    t.string   "country"
    t.string   "area"
    t.string   "number"
    t.string   "extension"
    t.integer  "vendor_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "phone_numbers", ["user_id"], :name => "index_phone_numbers_on_user_id"
  add_index "phone_numbers", ["vendor_id"], :name => "index_phone_numbers_on_vendor_id"

  create_table "servers_vendors", :id => false, :force => true do |t|
    t.integer "server_id"
    t.integer "vendor_id"
  end

  add_index "servers_vendors", ["server_id", "vendor_id"], :name => "index_servers_vendors_on_server_id_and_vendor_id"
  add_index "servers_vendors", ["vendor_id"], :name => "index_servers_vendors_on_vendor_id"

  create_table "users", :force => true do |t|
    t.integer  "role"
    t.string   "user_name"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vendors", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
