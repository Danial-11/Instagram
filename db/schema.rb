# frozen_string_literal: true

# Schema
ActiveRecord::Schema[7.0].define(version: 20_220_507_092_815) do
  enable_extension 'plpgsql'

  create_table 'comments', force: :cascade do |t|
    t.text 'content'
    t.bigint 'post_id', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_comments_on_post_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'likes', force: :cascade do |t|
    t.bigint 'post_id', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_likes_on_post_id'
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  create_table 'photos', force: :cascade do |t|
    t.string 'image'
    t.bigint 'post_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_photos_on_post_id'
  end

  create_table 'posts', force: :cascade do |t|
    t.string 'content'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_posts_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'username'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'comments', 'posts'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'likes', 'posts'
  add_foreign_key 'likes', 'users'
  add_foreign_key 'photos', 'posts'
  add_foreign_key 'posts', 'users'
end
