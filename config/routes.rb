Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "restaurants#index"

  resources :restaurants do
    resources :reviews, only: [:new, :create]
  end

  # get "restaurants" => "restaurants#index"
  # get "restaurants/new" => "restaurants#new"
  # post "restaurants" => "restaurant#create"
  # get "restaurants/:id" => "restaurant#show"
  # get "restaurants/:restaurant_id/reviews/new" => "reviews#new"
  # post "restaurants/:restaurant_id/reviews" => "review#create"
end
