Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :projects do
    resources :comments, only: [:create] do
      collection do
        get 'view_comments'
      end
    end
  end
end
