require "administrate/base_dashboard"

class ClientDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    main_contact: Field::BelongsTo.with_options(class_name: "ClientContact"),
    client_contacts: Field::HasMany,
    id: Field::Number,
    address: Field::String,
    phone: Field::String,
    email: Field::String,
    business_name: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    main_contact_id: Field::Number,
    nit: Field::String,
    city: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :main_contact,
    :client_contacts,
    :id,
    :address,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :main_contact,
    :client_contacts,
    :id,
    :address,
    :phone,
    :email,
    :business_name,
    :created_at,
    :updated_at,
    :main_contact_id,
    :nit,
    :city,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :main_contact,
    :client_contacts,
    :address,
    :phone,
    :email,
    :business_name,
    :main_contact_id,
    :nit,
    :city,
  ].freeze

  # Overwrite this method to customize how clients are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(client)
  #   "Client ##{client.id}"
  # end
end
