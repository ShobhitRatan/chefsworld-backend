Rails.application.routes.draw do
  resources :recipes
  resources :cuisines
  resources :meals
  resources :dishes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
