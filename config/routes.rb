Rails.application.routes.draw do
  get 'my_profile/index'
  get 'users/show'
  devise_for :users

  # devise_scope :user do
    get "/chats", to: "chats#index", as: "chats"
    get "/chats/:id", to: "chats#show", as: "chat"
    post "chats/:id", to: "messages#create", as: "chat_messages"
  # end

  root "posts#index"

  resources :posts do
    resources :comments, only: %i[create update destroy]
    resources :post_likes, only: %i[create]
  end
  resources :users, only: [:index]

  resources :favorites, only: [:index]
  resources :comments, only: [] do
    resources :comment_likes, only: %i[create]
  end
  get "/users/my_profile", to: "users#my_profile", as: "my_profile"
  post "/users/:id/", to: "followings#follow_unfollow", as: "follow_unfollow"
  get "/notifications", to: "notifications#index"
  get "/users/:id", to: "users#my_profile", as: "user"
  resources :notifications, only: [:index] do
    member do
      post :mark_as_read
    end
  end
  post "/posts/:id/favorites", to: "favorites#create"
end
