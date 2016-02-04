Rails.application.routes.draw do
  
  root 'books#index'

  devise_for :users
  resources :authors
  resources :books
end
