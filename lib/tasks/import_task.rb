sheet=ods.sheet("Hoja1")
(2..21).each do |i|
  s=sheet.row(i)
  i = Item.new
  i.CUM = s[0] || "n/a"
  i.ref = s[1]
  i.name = s[2]
  i.lab = s[3]
  i.presentation = s[4]
  i.price = s[5]
  i.vat = s[6]
  i.invima = s[7]
  i.save
  if s[8].nil?
  else
    ss = s[8].split(/\s*,\s*/)
    b = BatchItem.new
    b.item_id = i.id
    b.batch = ss.first.gsub "[", ""
    b.quantity = ss[1].to_i
    b.exp_date = ss.last.gsub "]", ""
    b.save
  end
  p i
  p b
end