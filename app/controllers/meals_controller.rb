class MealsController < ApplicationController
    def index 
        meals = Meal.all 
        render json: meals 
    end 

    def show 
        meal = Meal.find(params[:id]) 
        render json: meal 
    end 
end
