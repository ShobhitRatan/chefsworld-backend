Rails.application.routes.draw do
  resources :awards
  resources :educations
  resources :work_experiences
  resources :addresses
  resources :comments
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
  get '/users/stay_logged_in', to: 'users#stay_logged_in'
  get '/users/:id', to: 'users#show'
  resources :users 
  post '/login', to: 'users#login'
  post '/users', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
