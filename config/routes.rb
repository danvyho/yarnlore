Rails.application.routes.draw do
  get 'my_profile/index'
  get 'users/show'
  devise_for :users

  get "/chats", to: "chats#index", as: "chats"
  get "/chats/:id", to: "chats#show", as: "chat"
  post "/chats", to: "chats#create", as: "chat_create"
  post "chats/:id", to: "messages#create", as: "chat_messages"
  delete "/chats/:id", to: "chats#delete_chat", as: "delete_chat"


  root "posts#index"

  resources :posts do
    resources :comments, only: %i[create update destroy]
    resources :post_likes, only: [] do
      post 'toggle', on: :collection
    end
  end
  resources :users, only: [:index]

  resources :favorites, only: [:index] do
    post 'toggle', on: :collection
  end
  resources :comments, only: [] do
    resources :comment_likes, only: %i[create destroy]
  end

  get "/users/:id/followings", to: "followings#index_followings", as:"followings"
  get "/users/:id/followers", to: "followings#index_followers", as:"followers"
  get "/patterns", to: "posts#patterns", as: "trend_patterns"
  post "/patterns/new", to: "posts#new_patterns"
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
