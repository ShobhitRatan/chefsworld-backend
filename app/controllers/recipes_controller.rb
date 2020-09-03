class RecipesController < ApplicationController
    include Pagy::Backend 
    def index 
        pagy, recipes = pagy_extended(Recipe.all) 
        # recipes = Recipe.all  
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

    def pagy_extended(collection, vars={})
        pagy, paginated = pagy(collection, vars)
        { current_page: pagy.page,
          next_page:    pagy.next,
          prev_page:    pagy.prev,
          total_pages:  pagy.pages,
          total_count:  pagy.count }.each do |meth, val|
          paginated.define_singleton_method(meth){ val }
        end
        return pagy, paginated
      end

    private 

    def recipe_params 
        params.permit(:recipe, :user, :comments, :id, :label, :user_id, :meal, :dish, :cuisine, :ingredients, :image_url, :source, :source_url, :diet_labels, :health_labels, :cautions) 
    end 
end
