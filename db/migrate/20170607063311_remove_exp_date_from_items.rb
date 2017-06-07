class RemoveExpDateFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :exp_date
  end
end
