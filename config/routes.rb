Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get "/users/:id/chats", to: "chats#index", as: "chats"
    get "/users/:id/chats/:id", to: "chats#show", as: "chat"
    post "/users/:id/chats/:id", to: "chats#create_message", as: "chat_messages"
  end


  root "posts#index"

  resources :posts do
    resources :comments, only: %I[create update destroy]
  end

  get "/users/:id", to: "users#show", as: "user"
  get "/my_profile", to: "users#my_profile", as: "my_profile"
  get "/my_bookmarks", to: "users#my_bookmarks", as: "my_bookmarks"
  get "/my_notifications", to: "users#my_notifications", as: "my_notifications"

end
