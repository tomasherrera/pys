class CreateBatchItems < ActiveRecord::Migration
  def change
    create_table :batch_items do |t|
      t.references :item
      t.string :batch
      t.integer :quantity
      t.datetime :exp_date

      t.timestamps null: false
    end
  end
end
