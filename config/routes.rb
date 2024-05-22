Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about", to: "about#index"

  get "up" => "rails/health#show", as: :rails_health_check

  get "sign_up", to: "registrations#new"

  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"

  post "sign_in", to: "sessions#create"

  delete "log_out", to: "sessions#terminate"

  root to: "main#index"

  resources :posts, only: [:new, :create]
end
