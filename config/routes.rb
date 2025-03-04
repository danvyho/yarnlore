Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root "posts#index"

  resources :posts do
    resources :comments, only: [:create, :update, :destroy]
  end

  get "/posts/:id", to: "posts#show", as: "post"
  get '/posts/new', to: 'posts#new'
  post "posts", to: "posts#create"

  get "/users/:id", to: "users#show", as: "user"
  get "/my_profile", to: "users#my_profile", as: "my_profile"

end
