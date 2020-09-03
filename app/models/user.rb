class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable 
  devise :database_authenticatable, :registerable,  
         :recoverable, :rememberable, :validatable
  has_many :recipes 
  has_many :comments 
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
  def follow(user) 
    followees << user 
  end 

  def unfollow(followed_user) 
    followees.delete followed_user 
  end 
end
