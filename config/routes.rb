Rails.application.routes.draw do
  devise_for :users
  root to:"items#index"
  resources :purchases, only: [:index, :create] do
    resources :buyers, only: [:index, :create] 
  end
  resources :users, only: [:edit, :update]
  resources :items
end
