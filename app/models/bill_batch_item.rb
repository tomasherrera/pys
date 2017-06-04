class BillBatchItem < ActiveRecord::Base
  belongs_to :bill
  belongs_to :batch_item
end
