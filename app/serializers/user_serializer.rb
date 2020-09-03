class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :image_1, :image_2, :addresses, :work_experiences, :educations, :awards, :followees, :followers   
  has_many :addresses 
  has_many :work_experiences 
  has_many :educations
  has_many :awards 
  has_many :follower_followships, 
  class_name: "Followship",
  foreign_key: "follower_id",
  dependent: :destroy 
  has_many :followees, through: :follower_followships
  has_many :followee_fellowships, 
  class_name: "Followship",
  foreign_key: "followee_id", 
  dependent: :destroy 
  has_many :followers, through: :followee_fellowships 

end
