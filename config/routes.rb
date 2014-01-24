Onboard::Application.routes.draw do


  # the urls we need for omniauth

  get "auth/:provider/callback" => "social_logins#create"

  get "auth/:provider/failure" => "social_logins#failure"

  

  

  # has to match with your controllers
  # hook up urls with rooms controller

  #  orders are insdie beacuse we want to place an order
  resources :rooms do
    resources :orders, only: [:new, :create]

  end

  # my list of orders dont have to be on a room

  resources :orders, only: [:index, :show]


  # sign up our users to the site

  resources :users


  # log in and log out of our site
  # its a singular resource because we can only do one session

  resource :session

  # go to the home page
  root "rooms#index"

  


 
end
