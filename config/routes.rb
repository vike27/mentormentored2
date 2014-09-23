Rails.application.routes.draw do

  devise_for :users
  root 'pages#home'

  get '/about',   to: 'pages#about'
  get '/index',   to: 'pages#index'
  get '/contact',   to: 'pages#contact'
  get '/faq',   to: 'pages#faq'

  resources :users

end
