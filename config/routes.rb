# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # get '/articles/:id', to: 'articles#show'
  resources :articles
  root 'articles#index'
end
