    create_table "favorites", force: :cascade do |t|
      t.boolean "liked"
      t.bigint "user_id", null: false
      t.bigint "tweet_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["tweet_id"], name: "index_favorites_on_tweet_id"
      t.index ["user_id"], name: "index_favorites_on_user_id"
    end

    create_table "followings", force: :cascade do |t|
      t.integer "followed_id"
      t.integer "follower_id"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["followed_id", "follower_id"], name: "index_followings_on_followed_id_and_follower_id", unique: true
      t.index ["followed_id"], name: "index_followings_on_followed_id"
      t.index ["follower_id"], name: "index_followings_on_follower_id"
    end

    create_table "tweets", force: :cascade do |t|
      t.string "text"
      t.string "location"
      t.bigint "user_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["user_id"], name: "index_tweets_on_user_id"
    end

    create_table "users", force: :cascade do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.string "username"
      t.string "handle"
      t.string "description"
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end

    add_foreign_key "favorites", "tweets"
    add_foreign_key "favorites", "users"
    add_foreign_key "tweets", "users"
  end
end
