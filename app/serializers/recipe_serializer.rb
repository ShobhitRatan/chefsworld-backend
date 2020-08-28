class RecipeSerializer < ActiveModel::Serializer 
  attributes :id, :label, :user, :cuisine, :meal, :dish, :ingredients, :image_url, :source, :source_url, :diet_labels, :health_labels, :cautions 
  belongs_to :cuisine 
  belongs_to :meal 
  belongs_to :dish  
  belongs_to :user 
end
