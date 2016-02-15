Rails.application.routes.draw do
  
  root 'home#index'
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  
  resources :home, only: :index
  resources :category, only: [:index, :show]
  resources :authors, only: [:index, :show]

  resources :books, only: [:index, :show] do
    resources :ratings, only: [:new, :create]
  end
  # get "/ratings/new" => "ratings#new" 
  # resources :rating, only: :new

end
