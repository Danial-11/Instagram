Rails.application.routes.draw do
  root "posts#index"
  devise_for :users
  resources :users
  resources :stories
  resources :posts, only: [:index, :show, :create] do
    resources :photos, only: [:create]
    resources :likes, only: [:create, :destroy, :index, :show, :new, :update], shallow: true
    resources :comments, only: [:index, :create, :destroy], shallow: true
  end
end
