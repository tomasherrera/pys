class Client < ActiveRecord::Base
  belongs_to :main_contact, class_name: 'ClientContact'
  has_many :client_contacts
end