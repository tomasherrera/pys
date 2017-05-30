class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :CUM, null: false, default: "n/a"
      t.string :ref, null: false, default: "n/a"
      t.string :name, null: false, default: "n/a"
      t.string :lab, null: false, default: "n/a"
      t.string :batch, null: false, default: "n/a"
      t.datetime :exp_date, null: false, default: Time.now
      t.string :presentation, null: false, default: "n/a"

      t.timestamps null: false
    end
  end
end
