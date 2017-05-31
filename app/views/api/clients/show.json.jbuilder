json.client do 
  json.id @client.id
  json.nit @client.nit
  json.main_contact_name @client.main_contact.try(:name) || "No tiene"
  json.business_name @client.business_name
  json.phone @client.phone
  json.email @client.email
  json.address @client.address
  json.city @client.city
end
