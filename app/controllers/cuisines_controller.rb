class CuisinesController < ApplicationController
    def index 
        cuisines = Cuisine.all 
        render json: cuisines 

    def show 
        cuisine = Cuisine.find(params[:id]) 
        render json: cuisine 
    end 
end
