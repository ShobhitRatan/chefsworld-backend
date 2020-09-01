class AwardSerializer < ActiveModel::Serializer
  attributes :id, :description, :user, :received_date
  belongs_to :user 
end
