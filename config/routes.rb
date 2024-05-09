Rails.application.routes.draw do
  #Pictures
  get '/:logo.:jpg' => 'assets#images'
  
  #Comments
  resources :comments
  
  #Devise
  root to: "articles#home"
  devise_for :users
  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  #Workout Routes
  get "workout_logs/index"
  
  resources :workout_logs


  #Posts/LikesRoutes
  get 'posts/index'
  
  resources :posts do
    resources :likes
  end
  
  #Nutrition Routes
  get 'nutrition_logs/index'
  resources :nutrition_logs
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
