Rails.application.routes.draw do
  resources :workout_logs
  #Devise
  devise_for :users
  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  #Workout Routes
  root "workout_logs#index"
  
  resources :workout_logs


  #Posts/LikesRoutes
  get 'posts/index'
  
  resources :posts do
    resources :likes
  end
  
  #Medals Routes
  get 'medals/medals'
  #root to: "medals#medals"
  
  #Nutrition Routes
  get 'nutritionlogs/index'
  
  resources :nutrition_logs do
    post 'add_calories', on: :member
    post 'remove_calories', on: :member
    post 'add_sleep', on: :member
    post 'remove_sleep', on: :member
    post 'add_protein', on: :member
    post 'remove_protein', on: :member
  end 
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
