# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # get '/articles/:id', to: 'articles#show'
  get '/index', to: 'welcomes#index', as: :home
  get '/about', to: 'welcomes#about', as: :about
  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout
  resources :articles
  resources :users
  resources :categories
  root 'welcomes#index'
end
