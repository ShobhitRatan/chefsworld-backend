# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "pry" 
require 'rest-client'
require 'json' 
Meal.destroy_all 
Dish.destroy_all 
Cuisine.destroy_all 
Recipe.destroy_all 
# Meal Seed Data 
breakfast = Meal.create(meal: "Breakfast") 
lunch = Meal.create(meal: "Lunch") 
dinner = Meal.create(meal: "Dinner") 
snack = Meal.create(meal: "Snack") 
teatime = Meal.create(meal: "Teatime") 
# Dish Seed Data 
alcohols_and_cocktails = Dish.create(dish: "Alcohols and cocktails")
biscuits_and_cookies = Dish.create(dish: "Biscuits and cookies") 
bread = Dish.create(dish: "Bread") 
cereals = Dish.create(dish: "Cereals") 
condiments_and_sauces = Dish.create(dish: "Condiments and sauces") 
drinks = Dish.create(dish: "Drinks") 
desserts = Dish.create(dish: "Desserts") 
egg = Dish.create(dish: "Egg") 
main_course = Dish.create(dish: "Main course") 
omelet = Dish.create(dish: "Omelet") 
pancake = Dish.create(dish: "Pancake")
preps = Dish.create(dish: "Preps")
preserve = Dish.create(dish: "Preserve") 
salad = Dish.create(dish: "Salad") 
sandwiches = Dish.create(dish: "Sandwiches") 
soup = Dish.create(dish: "Soup") 
starter = Dish.create(dish: "Starter")
# Cuisine Seed Data 
american = Cuisine.create(cuisine: "American") 
asian = Cuisine.create(cuisine: "Asian") 
british = Cuisine.create(cuisine: "British") 
caribbean = Cuisine.create(cuisine: "Caribbean") 
central_europe = Cuisine.create(cuisine: "Central Europe") 
chinese = Cuisine.create(cuisine: "Chinese") 
eastern_europe = Cuisine.create(cuisine: "Eastern Europe") 
french = Cuisine.create(cuisine: "French") 
indian = Cuisine.create(cuisine: "Indian") 
italian = Cuisine.create(cuisine: "Italian") 
japanese = Cuisine.create(cuisine: "Japanese") 
kosher = Cuisine.create(cuisine: "Kosher") 
mediterranean = Cuisine.create(cuisine: "Mediterranean") 
mexican = Cuisine.create(cuisine: "Mexican") 
middle_eastern = Cuisine.create(cuisine: "Middle Eastern") 
nordic = Cuisine.create(cuisine: "Nordic") 
south_american = Cuisine.create(cuisine: "South American") 
south_east_asian = Cuisine.create(cuisine: "South East Asian") 
# Recipes Seed Data 
app_id = ENV["app_id"]
app_key = ENV["app_key"] 

def recipes_api(q, id, key)  
    base_url = "https://api.edamam.com/search?q=" 
    q = q.to_s  
    id = "&app_id=" + id.to_s 
    key = "&app_key=" + key.to_s     
    full_url = base_url + q + id + key
    restClientResponseObject = RestClient.get(full_url) 
    jsonButItsAString = restClientResponseObject.body 
    workable_hash = JSON.parse(jsonButItsAString)
end 


recipes_api("Alcohols and cocktails", app_id.to_s, app_key.to_s)["hits"].each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        cuisine: Cuisine.all.sample,  
        meal: Meal.all.sample,    
        dish: alcohols_and_cocktails,  
        ingredients: recipe["recipe"]["ingredientLines"].map{|i| "'" + i.to_s + "'"}.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| "'" + i.to_s + "'"}.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| "'" + i.to_s + "'"}.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| "'" + i.to_s + "'"}.join(",") 
    )
end 

recipes_api("Biscuits and cookies", app_id.to_s, app_key.to_s)["hits"].each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        cuisine: Cuisine.all.sample,  
        meal: Meal.all.sample,    
        dish: biscuits_and_cookies,  
        ingredients: recipe["recipe"]["ingredientLines"].map{|i| "'" + i.to_s + "'"}.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| "'" + i.to_s + "'"}.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| "'" + i.to_s + "'"}.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| "'" + i.to_s + "'"}.join(",") 
    )
end 

recipes_api("Bread", app_id.to_s, app_key.to_s)["hits"].each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        cuisine: Cuisine.all.sample,  
        meal: Meal.all.sample,    
        dish: bread,   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i| "'" + i.to_s + "'"}.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| "'" + i.to_s + "'"}.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| "'" + i.to_s + "'"}.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| "'" + i.to_s + "'"}.join(",") 
    )
end 

recipes_api("Cereals", app_id.to_s, app_key.to_s)["hits"].each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        cuisine: Cuisine.all.sample,  
        meal: Meal.all.sample,    
        dish: cereals,  
        ingredients: recipe["recipe"]["ingredientLines"].map{|i| "'" + i.to_s + "'"}.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| "'" + i.to_s + "'"}.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| "'" + i.to_s + "'"}.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| "'" + i.to_s + "'"}.join(",") 
    )
end 

recipes_api("Condiments and sauces", app_id.to_s, app_key.to_s)["hits"].each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        cuisine: Cuisine.all.sample,  
        meal: Meal.all.sample,    
        dish: condiments_and_sauces,  
        ingredients: recipe["recipe"]["ingredientLines"].map{|i| "'" + i.to_s + "'"}.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| "'" + i.to_s + "'"}.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| "'" + i.to_s + "'"}.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| "'" + i.to_s + "'"}.join(",") 
    )
end 

recipes_api("Drinks", app_id.to_s, app_key.to_s)["hits"].each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        cuisine: Cuisine.all.sample,  
        meal: Meal.all.sample,    
        dish: drinks,   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i| "'" + i.to_s + "'"}.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| "'" + i.to_s + "'"}.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| "'" + i.to_s + "'"}.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| "'" + i.to_s + "'"}.join(",") 
    )
end 

recipes_api("Desserts", app_id.to_s, app_key.to_s)["hits"].each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        cuisine: Cuisine.all.sample,  
        meal: Meal.all.sample,    
        dish: desserts,   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i| "'" + i.to_s + "'"}.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| "'" + i.to_s + "'"}.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| "'" + i.to_s + "'"}.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| "'" + i.to_s + "'"}.join(",") 
    )
end 

recipes_api("Egg", app_id.to_s, app_key.to_s)["hits"].each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        cuisine: Cuisine.all.sample,  
        meal: Meal.all.sample,    
        dish: egg,  
        ingredients: recipe["recipe"]["ingredientLines"].map{|i| "'" + i.to_s + "'"}.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| "'" + i.to_s + "'"}.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| "'" + i.to_s + "'"}.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| "'" + i.to_s + "'"}.join(",") 
    )
end 

recipes_api("Main course", app_id.to_s, app_key.to_s)["hits"].each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        cuisine: Cuisine.all.sample,  
        meal: Meal.all.sample,    
        dish: main_course,  
        ingredients: recipe["recipe"]["ingredientLines"].map{|i| "'" + i.to_s + "'"}.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| "'" + i.to_s + "'"}.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| "'" + i.to_s + "'"}.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| "'" + i.to_s + "'"}.join(",") 
    )
end 

recipes_api("Omelet", app_id.to_s, app_key.to_s)["hits"].each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        cuisine: Cuisine.all.sample,  
        meal: Meal.all.sample,    
        dish: omelet,  
        ingredients: recipe["recipe"]["ingredientLines"].map{|i| "'" + i.to_s + "'"}.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| "'" + i.to_s + "'"}.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| "'" + i.to_s + "'"}.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| "'" + i.to_s + "'"}.join(",") 
    )
end 

recipes_api("Pancakes", app_id.to_s, app_key.to_s)["hits"].each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        cuisine: Cuisine.all.sample,  
        meal: Meal.all.sample,    
        dish: pancake,  
        ingredients: recipe["recipe"]["ingredientLines"].map{|i| "'" + i.to_s + "'"}.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| "'" + i.to_s + "'"}.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| "'" + i.to_s + "'"}.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| "'" + i.to_s + "'"}.join(",") 
    )
end 

recipes_api("Preps", app_id.to_s, app_key.to_s)["hits"].each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        cuisine: Cuisine.all.sample,  
        meal: Meal.all.sample,    
        dish: preps,  
        ingredients: recipe["recipe"]["ingredientLines"].map{|i| "'" + i.to_s + "'"}.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| "'" + i.to_s + "'"}.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| "'" + i.to_s + "'"}.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| "'" + i.to_s + "'"}.join(",") 
    )
end 

recipes_api("Preserve", app_id.to_s, app_key.to_s)["hits"].each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        cuisine: Cuisine.all.sample,  
        meal: Meal.all.sample,    
        dish: preserve,  
        ingredients: recipe["recipe"]["ingredientLines"].map{|i| "'" + i.to_s + "'"}.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| "'" + i.to_s + "'"}.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| "'" + i.to_s + "'"}.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| "'" + i.to_s + "'"}.join(",") 
    )
end 

recipes_api("Salad", app_id.to_s, app_key.to_s)["hits"].each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        cuisine: Cuisine.all.sample,  
        meal: Meal.all.sample,    
        dish: salad,  
        ingredients: recipe["recipe"]["ingredientLines"].map{|i| "'" + i.to_s + "'"}.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| "'" + i.to_s + "'"}.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| "'" + i.to_s + "'"}.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| "'" + i.to_s + "'"}.join(",") 
    )
end 

recipes_api("Sandwiches", app_id.to_s, app_key.to_s)["hits"].each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        cuisine: Cuisine.all.sample,  
        meal: Meal.all.sample,    
        dish: sandwiches,  
        ingredients: recipe["recipe"]["ingredientLines"].map{|i| "'" + i.to_s + "'"}.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| "'" + i.to_s + "'"}.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| "'" + i.to_s + "'"}.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| "'" + i.to_s + "'"}.join(",") 
    )
end 

recipes_api("Soup", app_id.to_s, app_key.to_s)["hits"].each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        cuisine: Cuisine.all.sample,  
        meal: Meal.all.sample,    
        dish: soup,  
        ingredients: recipe["recipe"]["ingredientLines"].map{|i| "'" + i.to_s + "'"}.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| "'" + i.to_s + "'"}.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| "'" + i.to_s + "'"}.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| "'" + i.to_s + "'"}.join(",") 
    )
end 

recipes_api("Starter", app_id.to_s, app_key.to_s)["hits"].each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        cuisine: Cuisine.all.sample,  
        meal: Meal.all.sample,    
        dish: starter,  
        ingredients: recipe["recipe"]["ingredientLines"].map{|i| "'" + i.to_s + "'"}.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| "'" + i.to_s + "'"}.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| "'" + i.to_s + "'"}.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| "'" + i.to_s + "'"}.join(",") 
    )
end 

