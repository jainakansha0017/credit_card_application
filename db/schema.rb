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

ActiveRecord::Schema.define(version: 2021_11_17_125815) do

  create_table "approvals", force: :cascade do |t|
    t.integer "credit_card_id"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["credit_card_id"], name: "index_approvals_on_credit_card_id"
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string "email"
    t.string "aadhar_number"
    t.string "pan_number"
    t.string "account_number"
    t.string "ifsc"
    t.decimal "monthly_recurring_inflow", precision: 16, scale: 2
    t.decimal "monthly_recurring_outflow", precision: 16, scale: 2
    t.decimal "credit_limit", precision: 16, scale: 2
    t.integer "status", default: 0
    t.integer "credibility_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
