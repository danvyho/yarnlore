Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root "posts#index"

  resources :posts do
    resources :comments, only: [:create, :update, :destroy]
  end
  get "/favorites", to: "favorites#index"
  get "/notifications", to: "notifications#index"
  post "/posts/:id/favorites", to: "favorites#create"
  get "/users/:id", to: "users#show", as: "user"
  get "/my_profile", to: "users#my_profile", as: "my_profile"
end
