Rails.application.routes.draw do
  devise_for :users
  root to:"items#index"
  resources :items do
    resources :purchases, only: [:index, :create, :show] 
  end
  resources :users, only: [:edit, :update]
end
