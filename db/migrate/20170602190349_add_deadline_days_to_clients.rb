class AddDeadlineDaysToClients < ActiveRecord::Migration
  def change
    add_column :clients, :deadline_days, :integer
  end
end
