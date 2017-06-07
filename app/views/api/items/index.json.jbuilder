json.array! @items do |item|
  json.id item.id
  json.cum item.CUM
  json.ref item.ref
  json.name item.name
  json.lab item.lab
  json.presentation item.presentation
  json.price  item.price
  if item.vat
    json.vat 19
  else
    json.vat 0
  end
  json.invima item.invima
  i=item.quantity_total.to_i
  json.quantity i
  if i == 0
    json.empty true
  else
    json.empty false
  end
  json.batches item.batch_items do |batch_item|
    json.batch batch_item.batch
    json.exp_date batch_item.exp_date
    json.quantity batch_item.quantity  
  end

end