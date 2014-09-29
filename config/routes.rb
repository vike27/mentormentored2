Rails.application.routes.draw do

  devise_for :users
  root 'pages#home'

  get '/about',   to: 'pages#about'
  get '/index',   to: 'pages#index'
  get '/contact',   to: 'pages#contact'
  get '/faq',   to: 'pages#faq'

  resources :users

  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

end
