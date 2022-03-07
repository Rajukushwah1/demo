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

  resources :friendshipes

  get '/add_new_friend', to: "friendshipes#add_new_friend"

  get '/friend', to: "friendshipes#friend"
  #get '/destroy', to: "user_profile#destroy"
  get '/see_friend_request', to: "friendshipes#see_friend_request"


  #get 'friendship', to: "friendshipes#index"
end