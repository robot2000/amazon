Rails.application.routes.draw do
  devise_for :users
  resources :customers
  resources :authors
  resources :books
end
