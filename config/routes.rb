Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root "posts#index"

  resources :posts do
    resources :comments, only: [:create, :update, :destroy]
  end

  get "/users/:id", to: "users#show", as: "user"
  get "/my_profile", to: "users#my_profile", as: "my_profile"
  get "/my_bookmarks", to: "users#my_bookmarks", as: "my_bookmarks"
  get "/my_notifications", to: "users#my_notifications", as: "my_notifications"

end
