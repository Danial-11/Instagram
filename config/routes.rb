# frozen_string_literal: true

# routes
Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  resources :users do
  end
  get '/search', to: 'users#search'
  resources :posts, only: %i[index show create] do
    resources :photos, only: [:create]
    resources :likes, only: %i[create destroy index show new update], shallow: true
    resources :comments, only: %i[index create destroy], shallow: true
  end
end
