# frozen_string_literal: true

class CreateTables < ActiveRecord::Migration[6.1]
  def change
    create_table "children", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.uuid "parent_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["parent_id"], name: "index_decisioning_features_sets_on_parent_id", unique: true
    end

    create_table "parents", id: :serial, force: :cascade do |t|
      t.datetime "created_at"
      t.uuid "external_id", default: -> { "uuid_generate_v4()" }, null: false
    end
  end
end
