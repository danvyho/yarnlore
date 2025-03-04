Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users

  # devise_scope :user do
  #   resources :users, only: [:show], as: "user" do
  #     resources :chats, only: [:index]
  #   end
  # end

  devise_scope :user do
    get "/users/:id", to: "users#show", as: "user"
    get "/users/:id/chats", to: "chats#index", as: "chats"
  end


  root "posts#index"

  resources :posts do
    resources :comments, only: [:create, :update, :destroy]
  end

  get "/posts/:id", to: "posts#show", as: "post"
  get '/posts/new', to: 'posts#new'
  post "posts", to: "posts#create"
  get '/posts/:id/edit', to: 'posts#edit'
  # get "/users/:id", to: "users#show", as: "user"
  get "/my_profile", to: "users#my_profile", as: "my_profile"

end
