class DeleteNameFromClients < ActiveRecord::Migration
  def change
    add_column :clients, :main_contact_id, :integer, index: true, foreign_key: true
    remove_column :clients, :name
  end
end
