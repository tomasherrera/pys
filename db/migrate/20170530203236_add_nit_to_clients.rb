class AddNitToClients < ActiveRecord::Migration
  def change
    add_column :clients, :nit, :string, index: true, null: false, default: ""
  end
end
