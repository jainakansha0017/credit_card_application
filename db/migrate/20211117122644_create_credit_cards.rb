class CreateCreditCards < ActiveRecord::Migration[6.1]
  def change
    create_table :credit_cards do |t|
      t.string :email
      t.string :aadhar_number
      t.string :pan_number
      t.string :account_number
      t.string :ifsc
      t.decimal :monthly_recurring_inflow, precision: 16, scale: 2
      t.decimal :monthly_recurring_outflow, precision: 16, scale: 2
      t.decimal :credit_limit, precision: 16, scale: 2
      t.integer :status, default: 0
      t.integer :credibility_score
      t.timestamps
    end
  end
end
