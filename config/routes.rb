Rails.application.routes.draw do
  root "users#homepage"
  devise_for :users
end
