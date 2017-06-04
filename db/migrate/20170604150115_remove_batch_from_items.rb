class RemoveBatchFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :batch
  end
end
