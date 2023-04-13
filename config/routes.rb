Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  # resources :projects

  resources :projects do
    resources :comments, only: [:create]
  end
end
