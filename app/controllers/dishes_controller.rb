class DishesController < ApplicationController
    def index 
        dishes = Dish.all 
        render json: dishes 
    end 

    def show 
        dish = Dish.find(params[:id]) 
        render json: dish 
    end 
end
