Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root "posts#index"

  resources :posts do
    resources :comments, only: [:create, :update, :destroy]
  end

  get "/users/:id", to: "users#show", as: "user"
  get "/my_profile", to: "users#my_profile", as: "my_profile"

  resources :notifications, only: [:index] do
    member do
      post :mark_as_read
    end
  end
end
