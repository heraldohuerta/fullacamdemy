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

ActiveRecord::Schema.define(version: 20180331144602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "alternatives", force: :cascade do |t|
    t.string "detallepregunta"
    t.boolean "respuesta"
    t.bigint "questiontest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questiontest_id"], name: "index_alternatives_on_questiontest_id"
  end

  create_table "asignaturs", force: :cascade do |t|
    t.string "nombre"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_asignaturs_on_course_id"
  end

  create_table "contents", force: :cascade do |t|
    t.string "nombre"
    t.string "detalle"
    t.string "archivo"
    t.string "url_file"
    t.bigint "asignatur_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
    t.index ["asignatur_id"], name: "index_contents_on_asignatur_id"
    t.index ["course_id"], name: "index_contents_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "nombre"
    t.string "detealle"
    t.string "tiempo"
    t.string "foto"
    t.string "costo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.binary "firmware_image"
    t.string "firmware_image_filename"
    t.string "firmware_image_file_name"
    t.string "firmware_image_content_type"
    t.integer "firmware_image_file_size"
    t.datetime "firmware_image_updated_at"
  end

  create_table "questiontests", force: :cascade do |t|
    t.string "encunciado1"
    t.string "enunciado2"
    t.bigint "test_id"
    t.bigint "questiontype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questiontype_id"], name: "index_questiontests_on_questiontype_id"
    t.index ["test_id"], name: "index_questiontests_on_test_id"
  end

  create_table "questiontypes", force: :cascade do |t|
    t.string "tipo"
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string "nombre"
    t.string "puntajemax"
    t.string "puntajeapro"
    t.string "detalle"
    t.string "archivo"
    t.string "url_file"
    t.bigint "content_id"
    t.bigint "asignatur_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asignatur_id"], name: "index_tests_on_asignatur_id"
    t.index ["content_id"], name: "index_tests_on_content_id"
    t.index ["course_id"], name: "index_tests_on_course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "rut"
    t.string "nombres"
    t.string "apellidos"
    t.integer "edad"
    t.text "bio"
    t.string "foto"
    t.string "correo"
    t.string "telefoniafija"
    t.string "telefoniamovil"
    t.string "ultimocurso"
    t.string "colegio"
    t.string "nombrecontacto1"
    t.string "fonocontacto1"
    t.string "nombrecontacto2"
    t.string "fonocontacto2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "alternatives", "questiontests"
  add_foreign_key "asignaturs", "courses"
  add_foreign_key "contents", "asignaturs"
  add_foreign_key "contents", "courses"
  add_foreign_key "questiontests", "questiontypes"
  add_foreign_key "questiontests", "tests"
  add_foreign_key "tests", "asignaturs"
  add_foreign_key "tests", "contents"
  add_foreign_key "tests", "courses"
end
