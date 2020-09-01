class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user, :recipe, :content, :likes
  belongs_to :user 
  belongs_to :recipe 
end
