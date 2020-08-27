class DishSerializer < ActiveModel::Serializer 
  attributes :id, :dish 
  has_many :recipes 
end
