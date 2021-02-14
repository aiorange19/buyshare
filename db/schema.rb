# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_14_061929) do

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "商品カテゴリーマスターデータ", force: :cascade do |t|
    t.string "name", comment: "カテゴリー名"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "item_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "商品-カテゴリー紐付けテーブル", force: :cascade do |t|
    t.bigint "item_id", comment: "商品id"
    t.bigint "category_id", comment: "商品カテゴリーid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_item_categories_on_category_id"
    t.index ["item_id"], name: "index_item_categories_on_item_id"
  end

  create_table "item_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "商品コメントデータ", force: :cascade do |t|
    t.text "content", comment: "投稿内容"
    t.bigint "user_id", comment: "user_id"
    t.bigint "item_id", comment: "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_item_comments_on_item_id"
    t.index ["user_id"], name: "index_item_comments_on_user_id"
  end

  create_table "item_wants", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "買いたいデータ", force: :cascade do |t|
    t.bigint "user_id", comment: "user_id"
    t.bigint "item_id", comment: "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_item_wants_on_item_id"
    t.index ["user_id"], name: "index_item_wants_on_user_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "投稿商品データ", force: :cascade do |t|
    t.text "content", comment: "内容"
    t.string "buy_place", comment: "購入場所"
    t.integer "price", comment: "値段"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "いいねデータ", force: :cascade do |t|
    t.bigint "user_id", comment: "user_id"
    t.bigint "item_id", comment: "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_likes_on_item_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
