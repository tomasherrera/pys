class CreateClientContacts < ActiveRecord::Migration
  def change
    create_table :client_contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :position
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
