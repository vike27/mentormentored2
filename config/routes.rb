Rails.application.routes.draw do

  devise_for :users
  root 'pages#home'

  get '/about',   to: 'pages#about'
  get '/index',   to: 'pages#index'
  get '/faq',   to: 'pages#faq'

  resources :users
  resource :contact, only: [:new, :create]

  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

end
