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

ActiveRecord::Schema.define(version: 20160909190815) do

  create_table "Local", primary_key: "idLocal", force: :cascade do |t|
    t.string "nomeLocal",      limit: 45
    t.string "endereÃ§oLocal", limit: 45
  end

  add_index "Local", ["idLocal"], name: "idLocal_UNIQUE", unique: true, using: :btree

  create_table "Medicao", id: false, force: :cascade do |t|
    t.integer  "idMedicao",         limit: 4,  null: false
    t.datetime "dataMedicao",                  null: false
    t.float    "Medida",            limit: 53
    t.integer  "Medidor_idMedidor", limit: 4,  null: false
  end

  add_index "Medicao", ["Medidor_idMedidor"], name: "fk_Medicao_Medidor1_idx", using: :btree
  add_index "Medicao", ["dataMedicao"], name: "dataMedicao_UNIQUE", unique: true, using: :btree

  create_table "Medidor", id: false, force: :cascade do |t|
    t.integer "idMedidor",     limit: 4, null: false
    t.binary  "estadoMedidor", limit: 2
    t.integer "Local_idLocal", limit: 4, null: false
  end

  add_index "Medidor", ["Local_idLocal"], name: "fk_Medidor_Local1_idx", using: :btree
  add_index "Medidor", ["idMedidor"], name: "idMedidor_UNIQUE", unique: true, using: :btree

  create_table "buscas", force: :cascade do |t|
    t.date     "data_inicio"
    t.date     "data_fim"
    t.datetime "data_hora_inicio"
    t.datetime "data_hora_fim"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "medidor",          limit: 4
  end

  create_table "locals", force: :cascade do |t|
    t.integer  "idLocal",       limit: 4
    t.string   "nomeLocal",     limit: 45
    t.string   "endereçoLocal", limit: 45
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "locals", ["idLocal"], name: "index_locals_on_idLocal", unique: true, using: :btree

  create_table "medicaos", force: :cascade do |t|
    t.datetime "dataMedicao",            null: false
    t.float    "medida",      limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "medidor_id",  limit: 4
  end

  add_index "medicaos", ["medidor_id"], name: "index_medicaos_on_medidor_id", using: :btree

  create_table "medidors", force: :cascade do |t|
    t.integer  "idMedidor",     limit: 4
    t.boolean  "estadoMedidor"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "idLocal",       limit: 4
  end

  add_foreign_key "Medicao", "Medidor", column: "Medidor_idMedidor", primary_key: "idMedidor", name: "fk_Medicao_Medidor1"
  add_foreign_key "Medidor", "Local", column: "Local_idLocal", primary_key: "idLocal", name: "fk_Medidor_Local1"
  add_foreign_key "medicaos", "medidors"
end
