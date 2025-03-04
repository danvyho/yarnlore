Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get "/users/:id/chats", to: "chats#index", as: "chats"
  end


  root "posts#index"

  resources :posts do
    resources :comments, only: [:create, :update, :destroy]
  end

  get "/users/:id", to: "users#show", as: "user"
  get "/my_profile", to: "users#my_profile", as: "my_profile"

end
