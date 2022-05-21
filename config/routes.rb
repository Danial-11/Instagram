Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users, controllers: {
    confirmations: 'users/confirmations'
  }
  resources :users
  get '/search', to: 'users#search'
  resources :stories
  resources :posts, only: %i[index show create destroy] do
    resources :photos, only: [:create]
    resources :likes, only: %i[create destroy index show new update], shallow: true
    resources :comments, only: %i[index create destroy], shallow: true
  end
end
