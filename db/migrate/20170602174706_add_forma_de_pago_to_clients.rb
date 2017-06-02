class AddFormaDePagoToClients < ActiveRecord::Migration
  def change
    add_column :clients, :payment_form, :string
  end
end
