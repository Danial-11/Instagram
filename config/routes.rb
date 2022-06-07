# frozen_string_literal: true

# routes
require 'sidekiq/web'
require 'sidekiq/cron/web'
Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  resources :users
  mount Sidekiq::Web => '/sidekiq'
  get '/search', to: 'users#search'
  resources :stories
  resources :posts do
    resources :photos, only: [:create]
    resources :likes, only: %i[create destroy], shallow: true
    resources :comments, shallow: true
  end
end
