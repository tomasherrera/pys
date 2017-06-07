class Item < ActiveRecord::Base
  has_many :batch_items

  def quantity_total
    self.batch_items.sum(:quantity)
  end
end
