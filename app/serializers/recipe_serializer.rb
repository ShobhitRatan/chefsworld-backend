class RecipeSerializer < ActiveModel::Serializer 
  attributes :id, :label, :user, :cuisine, :meal, :dish, :ingredients, :image_url, :source, :source_url, :diet_labels, :health_labels, :cautions, :comments 
  belongs_to :user 
  has_many :comments
end
