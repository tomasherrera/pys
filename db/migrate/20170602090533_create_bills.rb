class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.references :client, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.datetime :due_date
      t.boolean :past_due
      t.integer :past_due_days
      t.string :status
      t.integer :total_due
      t.string :payment_form
      t.string :bill_number

      t.timestamps null: false
    end
  end
end
