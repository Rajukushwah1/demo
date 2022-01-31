Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "users/registrations"}
  root to: "home#index"

  get "/home", to: "home#index"
  resources :posts
  resources :comments
  delete "/comments/:id", to: "comments#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
