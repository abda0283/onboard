Onboard::Application.routes.draw do

  
  # has to match with your controllers
  # hook up urls with rooms controller
  resources :rooms


  # sign up our users to the site

  resources :users


  # log in and log out of our site
  # its a singular resource because we can only do one session

  resource :session

  # go to the home page
  root "rooms#index"

  


 
end
