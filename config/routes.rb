Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:create]
    end
  end

  namespace :api do
    resources :users do
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :show, :new, :create]
      end
    end
  end
end
