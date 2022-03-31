Rails.application.routes.draw do
  get 'users/show'
  post 'messages', to: 'messages#create'
 
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  
  root to: "posts#index"

  get "/home", to: "home#index"
  
  resources :posts
  get "/show_notification", to: "posts#show_notification"
  
  resources :comments

  resources :likes, only: [:create, :destroy]
  
  resources :user_profile

  get '/another_user/:id', to: "user_profile#another_user"

  resources :friendshipes

  get '/add_new_friend', to: "friendshipes#add_new_friend"

  get '/friend', to: "friendshipes#friend"
 
  get '/see_friend_request', to: "friendshipes#see_friend_request"

  get '/chat', to: "pages#chat"


  resources :rooms do
    resources :msgs
  end

  get 'user/:id', to: 'users#show', as: 'user'
 
end