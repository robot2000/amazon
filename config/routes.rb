Rails.application.routes.draw do
  
  root 'home#index' #, as: 'home'
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  #devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'omniauth_callbacks' }
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  #devise_for :users


  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  
  resources :home, only: :index
  resources :category, only: [:index, :show]
  resources :authors, only: [:index, :show]

  resources :books, only: [:index, :show] do
    resources :ratings, only: [:new, :create]
  end
  # get "/ratings/new" => "ratings#new" 
  # resources :rating, only: :new
  
  resources :orders, only: [:index, :show, :update, :destroy]

  resources :order_items, except: [:new, :show, :edit]
end
