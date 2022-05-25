Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users, controllers: {
    confirmations: 'users/confirmations'
  }
  resources :users
  get '/search', to: 'users#search'
  resources :stories
  resources :posts do
    resources :photos, only: [:create]
    resources :likes, only: %i[create destroy], shallow: true
    resources :comments, only: %i[index create destroy], shallow: true
  end
end
