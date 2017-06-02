Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :clients
    resources :client_contacts
    resources :items

    root to: "users#index"
  end

  namespace :api do
    resources :clients
  end

  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :visitors
end
