class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :addresses, :work_experiences, :educations, :awards   
  has_many :addresses 
  has_many :work_experiences 
  has_many :educations
  has_many :awards 
end
