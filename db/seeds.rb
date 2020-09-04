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
Followship.destroy_all 
# User Seed Data 
barry = User.create(
    email: "barryallen@gmail.com",
    password: "Pass$123", 
    admin: true, 
    name: "Barry Allen", 
    image_1: "https://vignette.wikia.nocookie.net/garpedia/images/d/d5/Barry_Allen.jpg/revision/latest?cb=20190213172819", 
    image_2: "https://vignette.wikia.nocookie.net/arrow/images/9/90/The_Flash.png/revision/latest?cb=20200507231946"
) 
oliver = User.create(
    email: "oliverqueen@outlook.com",
    password: "Pass$123", 
    admin: true, 
    name: "Oliver Queen", 
    image_1: "https://vignette.wikia.nocookie.net/arrow/images/c/c4/Oliver_Queen.png/revision/latest?cb=20200614203702", 
    image_2: "https://vignette.wikia.nocookie.net/arrow/images/d/d1/Green_Arrow.png/revision/latest?cb=20200528020024"
) 
tony = User.create(
    email: "tonystark@gmail.com",
    password: "Pass$123",
    admin: false, 
    name: "Tony Stark", 
    image_1: "https://m.hindustantimes.com/rf/image_size_1200x900/HT/p2/2019/08/12/Pictures/_ca1ae8d6-bcf4-11e9-9bc9-c6f10a5dc6e3.jpg",
    image_2: "https://pbs.twimg.com/profile_images/1114951635116208128/MF1zYXby_400x400.png" 
)
# Followships seed data
followship_1 = Followship.create(follower: barry, followee: oliver) 
followship_2 = Followship.create(follower: oliver, followee: barry) 
followship_3 = Followship.create(follower: oliver, followee: tony) 
followship_4 = Followship.create(follower: tony, followee: oliver) 
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

meal_recipes_api("", app_id.to_s, app_key.to_s, "breakfast", 0.to_s, 50.to_s)["hits"].uniq.each do |recipe| 
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

meal_recipes_api("", app_id.to_s, app_key.to_s, "breakfast", 50.to_s, 100.to_s)["hits"].uniq.each do |recipe| 
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

meal_recipes_api("", app_id.to_s, app_key.to_s, "breakfast", 150.to_s, 200.to_s)["hits"].uniq.each do |recipe| 
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

meal_recipes_api("", app_id.to_s, app_key.to_s, "breakfast", 200.to_s, 250.to_s)["hits"].uniq.each do |recipe| 
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


meal_recipes_api("", app_id.to_s, app_key.to_s, "lunch", 0.to_s, 50.to_s)["hits"].uniq.each do |recipe| 
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

meal_recipes_api("", app_id.to_s, app_key.to_s, "lunch", 50.to_s, 100.to_s)["hits"].uniq.each do |recipe| 
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

meal_recipes_api("", app_id.to_s, app_key.to_s, "lunch", 100.to_s, 150.to_s)["hits"].uniq.each do |recipe| 
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

meal_recipes_api("", app_id.to_s, app_key.to_s, "lunch", 150.to_s, 200.to_s)["hits"].uniq.each do |recipe| 
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

meal_recipes_api("", app_id.to_s, app_key.to_s, "lunch", 200.to_s, 250.to_s)["hits"].uniq.each do |recipe| 
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

meal_recipes_api("", app_id.to_s, app_key.to_s, "dinner", 0.to_s, 50.to_s)["hits"].uniq.each do |recipe| 
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

meal_recipes_api("", app_id.to_s, app_key.to_s, "dinner", 50.to_s, 100.to_s)["hits"].uniq.each do |recipe| 
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

meal_recipes_api("", app_id.to_s, app_key.to_s, "dinner", 100.to_s, 150.to_s)["hits"].uniq.each do |recipe| 
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

meal_recipes_api("", app_id.to_s, app_key.to_s, "dinner", 150.to_s, 200.to_s)["hits"].uniq.each do |recipe| 
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

meal_recipes_api("", app_id.to_s, app_key.to_s, "dinner", 200.to_s, 250.to_s)["hits"].uniq.each do |recipe| 
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

meal_recipes_api("", app_id.to_s, app_key.to_s, "snack", 0.to_s, 20.to_s)["hits"].uniq.each do |recipe| 
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

meal_recipes_api("", app_id.to_s, app_key.to_s, "snack", 20.to_s, 40.to_s)["hits"].uniq.each do |recipe| 
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

meal_recipes_api("", app_id.to_s, app_key.to_s, "snack", 40.to_s, 60.to_s)["hits"].uniq.each do |recipe| 
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

meal_recipes_api("", app_id.to_s, app_key.to_s, "snack", 60.to_s, 80.to_s)["hits"].uniq.each do |recipe| 
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

meal_recipes_api("", app_id.to_s, app_key.to_s, "snack", 80.to_s, 100.to_s)["hits"].uniq.each do |recipe| 
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

