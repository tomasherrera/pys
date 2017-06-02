json.array! @bills do |bill|
  json.id bill.id
  json.bill_number bill.bill_number
  json.client_id bill.client_id
  json.client_name bill.try(:client).try(:business_name)
  json.order_number bill.try(:order).try(:order_number) || "N/A"
  json.user bill.user.name
  json.due_date bill.due_date
  json.past_due bill.past_due
  json.past_due_days bill.past_due_days
  json.status bill.status
end
