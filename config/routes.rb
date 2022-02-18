Rails.application.routes.draw do


  devise_for :users, :controllers => {:registrations => "users/registrations"}
  root to: "home#index"

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
  #get 'friendship', to: "friendshipes#index"
end