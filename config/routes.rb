Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  root to: "posts#index"

  get "/home", to: "home#index"

  resources :posts do 
    collection do
      get 'me'
    end
  end 

  resources :comments
  resources :likes, only: [:create, :destroy]
  
  #delete "/comments/:id", to: "comments#destroy"
 
  resources :user_profile
  get '/another_user/:id', to: "user_profile#another_user"

  get '/add_new_friend', to: "user_profile#add_new_friend"

  get '/friend', to: "user_profile#friend"
  #get '/destroy', to: "user_profile#destroy"
  get '/see_friend_request', to: "user_profile#see_friend_request"

  resources :friendshipes

  #get 'friendship', to: "friendshipes#index"
end