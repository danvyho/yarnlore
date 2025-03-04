Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "/posts/:id", to: "posts#show", as: "post"

end
