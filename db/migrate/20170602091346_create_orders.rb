class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_number
      t.datetime :entry_date
      t.string :status
      t.string :observations
      t.references :user, index: true, foreign_key: true
      t.integer :auth_user_id
      t.datetime :dispatch_date
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
