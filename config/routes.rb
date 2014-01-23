Onboard::Application.routes.draw do

  
  # has to match with your controllers
  # hook up urls with rooms controller
  resources :rooms


  # sign up our users to the site

  resources :users

  # go to the home page
  root "rooms#index"

  


 
end
