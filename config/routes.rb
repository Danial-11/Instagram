Rails.application.routes.draw do
  root "users#homepage"
  get 'search', to: "users#search"
  devise_for :users
  resources :users
  resources :posts, only: [:index, :show, :create] do
    resources :photos, only: [:create]
  end
end
