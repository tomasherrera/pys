class AddInvimaToItems < ActiveRecord::Migration
  def change
    add_column :items, :invima, :string, index: true
  end
end
