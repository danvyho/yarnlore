Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "pages#home"

  get "/posts/:id", to: "posts#show", as: "post"

  get "/users/:id", to: "users#show", as: "user"
  get "/my_profile", to: "users#my_profile", as: "my_profile"

end
