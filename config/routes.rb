Rails.application.routes.draw do
  # devise_for :admins
  # devise_for :users, path: '', path_names: {
  #   sign_in: 'login', 
  #   sign_out: 'logout',
  #   registration: 'signup'
  # },
  # controllers: {
  #   sessions: 'users/sessions',
  #   registrations: 'users/registrations' 
  # }
  resources :recipes
  resources :cuisines
  resources :meals
  resources :dishes
  get '/users/stay_logged_in', to: 'users#stay_logged_in'
  get '/users/:id', to: 'users#show'
  post '/login', to: 'users#login'
  post '/users', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
