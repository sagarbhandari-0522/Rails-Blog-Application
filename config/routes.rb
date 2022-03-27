# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # get '/articles/:id', to: 'articles#show'
  get '/index', to: 'welcomes#index', as: :home
  get '/about', to: 'welcomes#about', as: :about
  resources :articles
  resources :users
  root 'welcomes#index'
end
