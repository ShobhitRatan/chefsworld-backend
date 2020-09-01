class RecipesController < ApplicationController
    def index 
        recipes = Recipe.all 
        render json: recipes 
    end  

    def show 
        recipe = Recipe.find(params[:id]) 
        render json: recipe 
    end 

    def create 
        recipe = Recipe.create(recipe_params) 
        render json: recipe 
    end 

    def update 
        recipe = Recipe.find(params[:id]) 
        recipe.update(recipe_params) 
        render json: recipe 

    end 

    def destroy 
        recipe = Recipe.find(params[:id]) 
        unless recipe.nil?
            recipe.destroy 
            render json: recipe 
        else  
            render json: {error: "Recipe not found"}, status: 404 
        end 
    end 

    private 

    def recipe_params 
        params.permit(:recipe, :user, :comments, :id, :label, :user_id, :meal, :dish, :cuisine, :ingredients, :image_url, :source, :source_url, :diet_labels, :health_labels, :cautions) 
    end 
end
