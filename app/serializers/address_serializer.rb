class AddressSerializer < ActiveModel::Serializer
  attributes :id, :user, :address_type, :address, :city, :state, :country, :zipcode
  belongs_to :user 
end
