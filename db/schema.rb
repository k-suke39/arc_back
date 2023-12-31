# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_231_020_012_955) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'authentications', force: :cascade do |t|
    t.string 'provider', null: false
    t.string 'uid', null: false
    t.string 'name', null: false
    t.string 'email', null: false
    t.integer 'role'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'chapters', force: :cascade do |t|
    t.bigint 'work_id', null: false
    t.string 'name', null: false
    t.string 'slug', null: false
    t.integer 'order_number', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['work_id'], name: 'index_chapters_on_work_id'
  end

  create_table 'comments', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'post_id', null: false
    t.text 'content', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_comments_on_post_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'follows', force: :cascade do |t|
    t.bigint 'follower_id'
    t.bigint 'followed_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['followed_id'], name: 'index_follows_on_followed_id'
    t.index ['follower_id'], name: 'index_follows_on_follower_id'
  end

  create_table 'likes', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'post_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_likes_on_post_id'
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  create_table 'post_categories', force: :cascade do |t|
    t.bigint 'post_id', null: false
    t.bigint 'category_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_post_categories_on_category_id'
    t.index ['post_id'], name: 'index_post_categories_on_post_id'
  end

  create_table 'post_tags', force: :cascade do |t|
    t.bigint 'post_id', null: false
    t.bigint 'tag_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_post_tags_on_post_id'
    t.index ['tag_id'], name: 'index_post_tags_on_tag_id'
  end

  create_table 'posts', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.string 'title', null: false
    t.text 'body', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_posts_on_user_id'
  end

  create_table 'practices', force: :cascade do |t|
    t.bigint 'chapter_id', null: false
    t.bigint 'work_id', null: false
    t.bigint 'user_id', null: false
    t.string 'title', null: false
    t.text 'question', null: false
    t.text 'answer', null: false
    t.integer 'order_number', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['chapter_id'], name: 'index_practices_on_chapter_id'
    t.index ['user_id'], name: 'index_practices_on_user_id'
    t.index ['work_id'], name: 'index_practices_on_work_id'
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'email', null: false
    t.string 'password', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'works', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'description', null: false
    t.string 'slug', null: false
    t.integer 'order_number', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'chapters', 'works'
  add_foreign_key 'comments', 'posts'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'follows', 'users', column: 'followed_id'
  add_foreign_key 'follows', 'users', column: 'follower_id'
  add_foreign_key 'likes', 'posts'
  add_foreign_key 'likes', 'users'
  add_foreign_key 'post_categories', 'categories'
  add_foreign_key 'post_categories', 'posts'
  add_foreign_key 'post_tags', 'posts'
  add_foreign_key 'post_tags', 'tags'
  add_foreign_key 'posts', 'users'
  add_foreign_key 'practices', 'chapters'
  add_foreign_key 'practices', 'users'
  add_foreign_key 'practices', 'works'
end
