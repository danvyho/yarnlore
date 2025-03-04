Rails.application.routes.draw do
  devise_for :users

  get "/posts/:id", to: "posts#show", as: "post"
  root "posts#index"

  get '/posts/new', to: 'posts#new'
  post "posts", to: "posts#create"
end
