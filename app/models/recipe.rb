class Recipe < ApplicationRecord
    belongs_to :cuisine 
    belongs_to :meal 
    belongs_to :dish 
    belongs_to :user 
end
