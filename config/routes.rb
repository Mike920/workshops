Rails.application.routes.draw do

  get 'users/index'

  get 'users/show'

  devise_for :users
  resources :users, only: [:show]
  get 'users/' => 'users#index'

  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  root 'categories#index'
end
