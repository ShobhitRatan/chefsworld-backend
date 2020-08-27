class CuisineSerializer < ActiveModel::Serializer  
  attributes :id, :cuisine
  has_many :recipes 
end
