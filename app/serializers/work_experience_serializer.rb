class WorkExperienceSerializer < ActiveModel::Serializer
  attributes :id, :user, :chef_type, :experience, :employer_name, :start_date, :end_date, :current_workplace, :title, :description, :city, :state, :country
  belongs_to :user 
end
