class Bill < ActiveRecord::Base
  belongs_to :client
  belongs_to :order
  belongs_to :user

  after_create :generate_bill_number

  def generate_bill_number
    self.bill_number = "%.8d" % id
    self.save!
  end
end
