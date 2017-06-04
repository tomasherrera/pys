class AddPriceAndVatToItems < ActiveRecord::Migration
  def change
    add_column :items, :price, :decimal, :precision => 8, :scale => 2
    add_column :items, :vat, :boolean, default: "false"
  end
end
