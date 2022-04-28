Rails.application.routes.draw do
  root "posts#index"
  devise_for :users
  resources :users
  resources :posts, only: [:index, :show, :create] do
    resources :photos, only: [:create]
  end
end
