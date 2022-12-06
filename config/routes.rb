Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :matches, only: [:index, :create]
    end
    namespace :v2 do
      resources :users, only: [:create]
      get '/authenticate', to: 'users#authenticate'
    end
  end
  
end
