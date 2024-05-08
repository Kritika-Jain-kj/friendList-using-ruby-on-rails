Rails.application.routes.draw do
  devise_for :users
  resources :frnds
  #get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #root 'home#index'
  get 'home/about'
  
  root 'frnds#index'
end
