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

Recipe.destroy_all 
User.destroy_all 
Comment.destroy_all 
Address.destroy_all 
WorkExperience.destroy_all
# User Seed Data 
barry = User.create(
    email: "barryallen@gmail.com",
    password: "Pass$123", 
    admin: true, 
    name: "Barry Allen"
) 
oliver = User.create(
    email: "oliverqueen@outlook.com",
    password: "Pass$123", 
    admin: true, 
    name: "Oliver Queen"
) 
tony = User.create(
    email: "tonystark@gmail.com",
    password: "Pass$123",
    admin: false, 
    name: "Tony Stark" 
)
# Address seed data 
address_1 = Address.create(
    user: barry, 
    address_type: "Home", 
    address: "518 Queen Street", 
    city: "Westbury", 
    state: "New York", 
    country: "United States", 
    zipcode: "11590") 
address_2 = Address.create(
    user: oliver, 
    address_type: "Office",
    address: "One Bernard Baruch Way", 
    city: "New York", 
    state: "New York", 
    country: "United States",
    zipcode: "10010") 
address_3 = Address.create(
    user: tony, 
    address_type: "Work",
    address: "Avengers Tower",
    city: "New York", 
    state: "New York",
    country: "United States",
    zipcode: "10010" 
)
# Work Experience Data 
work_experience_1 = WorkExperience.create(
    user: barry, 
    chef_type: "Head Chef",
    experience: "5", 
    employer_name: "Joe West",
    start_date: "09/2014", 
    end_date: "Present",
    current_workplace: "Star Restaurant", 
    title: "Head Chef", 
    description: "Over 5 years of experience as a chef, specializes in American and Italian but expert in all cuisines.", 
    city: "New York", 
    state: "New York",
    country: "United States"
)
# Recipes Seed Data
app_id = ENV["app_id"]
app_key = ENV["app_key"] 

def meal_recipes_api(q, id, key, mealType, from, to)  
    base_url = "https://api.edamam.com/search?q=" 
    q = q.to_s  
    id = "&app_id=" + id.to_s 
    key = "&app_key=" + key.to_s   
    mealType = "&mealType=" + mealType.to_s  
    from = "&from=" + from.to_s 
    to = "&to=" + to.to_s 
    full_url = base_url + q + id + key + mealType + from + to 
    restClientResponseObject = RestClient.get(full_url) 
    jsonButItsAString = restClientResponseObject.body 
    workable_hash = JSON.parse(jsonButItsAString)
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "breakfast", 0.to_s, 100.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "breakfast", 100.to_s, 200.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "breakfast", 200.to_s, 300.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "breakfast", 300.to_s, 400.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "breakfast", 400.to_s, 500.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "lunch", 0.to_s, 100.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "lunch", 100.to_s, 200.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "lunch", 200.to_s, 300.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "lunch", 300.to_s, 400.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "lunch", 400.to_s, 500.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "dinner", 0.to_s, 100.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "dinner", 100.to_s, 200.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "dinner", 200.to_s, 300.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "dinner", 300.to_s, 400.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "dinner", 400.to_s, 500.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "snack", 0.to_s, 100.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "snack", 100.to_s, 200.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "snack", 200.to_s, 300.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "snack", 300.to_s, 400.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "snack", 400.to_s, 500.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "teatime", 0.to_s, 100.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "teatime", 100.to_s, 200.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "teatime", 200.to_s, 300.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "teatime", 300.to_s, 400.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

meal_recipes_api("", app_id.to_s, app_key.to_s, "teatime", 400.to_s, 500.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

def dish_recipes_api(q, id, key, dishType, from, to)  
    base_url = "https://api.edamam.com/search?q=" 
    q = q.to_s  
    id = "&app_id=" + id.to_s 
    key = "&app_key=" + key.to_s   
    dishType = "&dishType=" + dishType.to_s  
    from = "&from=" + from.to_s 
    to = "&to=" + to.to_s 
    full_url = base_url + q + id + key + dishType + from + to 
    restClientResponseObject = RestClient.get(full_url) 
    jsonButItsAString = restClientResponseObject.body 
    workable_hash = JSON.parse(jsonButItsAString)
end 

dish_recipes_api("", app_id.to_s, app_key.to_s, "Alcohol-cocktail", 0.to_s, 30.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

dish_recipes_api("", app_id.to_s, app_key.to_s, "Biscuits and cookies", 0.to_s, 30.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

dish_recipes_api("", app_id.to_s, app_key.to_s, "Bread", 0.to_s, 30.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

dish_recipes_api("", app_id.to_s, app_key.to_s, "Cereals", 0.to_s, 30.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

dish_recipes_api("", app_id.to_s, app_key.to_s, "Condiments and sauces", 0.to_s, 30.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

dish_recipes_api("", app_id.to_s, app_key.to_s, "Drinks", 0.to_s, 30.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

dish_recipes_api("", app_id.to_s, app_key.to_s, "Desserts", 0.to_s, 30.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

dish_recipes_api("", app_id.to_s, app_key.to_s, "Egg", 0.to_s, 30.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

dish_recipes_api("", app_id.to_s, app_key.to_s, "Main course", 0.to_s, 30.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

dish_recipes_api("", app_id.to_s, app_key.to_s, "Omelet", 0.to_s, 30.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

dish_recipes_api("", app_id.to_s, app_key.to_s, "Pancake", 0.to_s, 30.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

dish_recipes_api("", app_id.to_s, app_key.to_s, "Preps", 0.to_s, 30.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

dish_recipes_api("", app_id.to_s, app_key.to_s, "Preserve", 0.to_s, 30.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

dish_recipes_api("", app_id.to_s, app_key.to_s, "Salad", 0.to_s, 30.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

dish_recipes_api("", app_id.to_s, app_key.to_s, "Sandwiches", 0.to_s, 30.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

dish_recipes_api("", app_id.to_s, app_key.to_s, "Soup", 0.to_s, 30.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

dish_recipes_api("", app_id.to_s, app_key.to_s, "Starter", 0.to_s, 30.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

def cuisine_recipes_api(q, id, key, cuisineType, from, to)  
    base_url = "https://api.edamam.com/search?q=" 
    q = q.to_s  
    id = "&app_id=" + id.to_s 
    key = "&app_key=" + key.to_s   
    cuisineType = "&dishType=" + cuisineType.to_s  
    from = "&from=" + from.to_s 
    to = "&to=" + to.to_s 
    full_url = base_url + q + id + key + cuisineType + from + to 
    restClientResponseObject = RestClient.get(full_url) 
    jsonButItsAString = restClientResponseObject.body 
    workable_hash = JSON.parse(jsonButItsAString)
end 

cuisine_recipes_api("", app_id.to_s, app_key.to_s, "American", 0.to_s, 20.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

cuisine_recipes_api("", app_id.to_s, app_key.to_s, "Asian", 0.to_s, 20.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

cuisine_recipes_api("", app_id.to_s, app_key.to_s, "British", 0.to_s, 20.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

cuisine_recipes_api("", app_id.to_s, app_key.to_s, "Caribbean", 0.to_s, 20.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

cuisine_recipes_api("", app_id.to_s, app_key.to_s, "Central Europe", 0.to_s, 20.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

cuisine_recipes_api("", app_id.to_s, app_key.to_s, "Chinese", 0.to_s, 20.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

cuisine_recipes_api("", app_id.to_s, app_key.to_s, "Eastern Europe", 0.to_s, 20.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

cuisine_recipes_api("", app_id.to_s, app_key.to_s, "French", 0.to_s, 20.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

cuisine_recipes_api("", app_id.to_s, app_key.to_s, "Indian", 0.to_s, 20.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

cuisine_recipes_api("", app_id.to_s, app_key.to_s, "Italian", 0.to_s, 20.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

cuisine_recipes_api("", app_id.to_s, app_key.to_s, "Japanese", 0.to_s, 20.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

cuisine_recipes_api("", app_id.to_s, app_key.to_s, "Kosher", 0.to_s, 20.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

cuisine_recipes_api("", app_id.to_s, app_key.to_s, "Mediterranean", 0.to_s, 20.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

cuisine_recipes_api("", app_id.to_s, app_key.to_s, "Mexican", 0.to_s, 20.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

cuisine_recipes_api("", app_id.to_s, app_key.to_s, "Middle Eastern", 0.to_s, 20.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

cuisine_recipes_api("", app_id.to_s, app_key.to_s, "Nordic", 0.to_s, 20.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

cuisine_recipes_api("", app_id.to_s, app_key.to_s, "South American", 0.to_s, 20.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

cuisine_recipes_api("", app_id.to_s, app_key.to_s, "South East Asian", 0.to_s, 20.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 

cuisine_recipes_api("", app_id.to_s, app_key.to_s, "world", 0.to_s, 20.to_s)["hits"].uniq.each do |recipe| 
    recipe = Recipe.create(
        label: recipe["recipe"]["label"],
        user: User.all.sample, 
        cuisine: recipe["recipe"]["cuisineType"].map{|i|  i.to_s }.join(","),   
        meal: recipe["recipe"]["mealType"].map{|i|  i.to_s }.join(","),    
        dish: recipe["recipe"]["dishType"].map{|i|  i.to_s }.join(","),   
        ingredients: recipe["recipe"]["ingredientLines"].map{|i|  i.to_s }.join(","), 
        image_url: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"], 
        source_url: recipe["recipe"]["url"], 
        diet_labels: recipe["recipe"]["dietLabels"].map{|i| i.to_s }.join(","),
        health_labels: recipe["recipe"]["healthLabels"].map{|i| i.to_s }.join(","), 
        cautions: recipe["recipe"]["cautions"].map{|i| i.to_s }.join(",") 
    )
end 
# Comment seed data 
1000.times do 
    Comment.create({
        recipe: Recipe.all.sample, 
        user: User.all.sample,
        content: Faker::TvShows::Suits.quote,
        likes: rand(1..1000)
    })
end 

