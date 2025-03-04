Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root "posts#index"
  
  get "/posts/:id", to: "posts#show", as: "post"
  get '/posts/new', to: 'posts#new'
  post "posts", to: "posts#create"
  get '/posts/:id/edit', to: 'posts#edit'
  
  get "/users/:id", to: "users#show", as: "user"
  get "/my_profile", to: "users#my_profile", as: "my_profile"
  
end
