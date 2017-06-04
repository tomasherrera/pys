class CreateBillBatchItems < ActiveRecord::Migration
  def change
    create_table :bill_batch_items do |t|
      t.references :bill, index: true, foreign_key: true
      t.references :batch_item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
