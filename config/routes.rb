Rails.application.routes.draw do
  get "api/v3"
  get "api/tickets"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :matches, only: [:index, :create, :destroy]
    end
    namespace :v2 do
      resources :users, only: [:create]
      post "/authenticate", to: "users#authenticate"
    end
    namespace :v3 do
      resources :tickets, only: [:index, :create]
    end
  end
end
