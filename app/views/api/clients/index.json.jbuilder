json.array! @clients do |client|
  json.main_contact_name client.main_contact.try(:name) || "Sin Contacto Principal"
  json.business_name client.business_name
end