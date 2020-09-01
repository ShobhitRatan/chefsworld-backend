class EducationSerializer < ActiveModel::Serializer
  attributes :id, :description, :user, :entry_date, :end_date, :enrollment_status
  belongs_to :user 
end
