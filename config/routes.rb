Rails.application.routes.draw do
  namespace :api do
    resources :clients
  end

  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :visitors
end
