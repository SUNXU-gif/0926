Rails.application.routes.draw do
  get "home/top"
  root "home#top"

  devise_for :users
  resources :posts
  resources :mypages, only: [:show, :edit, :update]
end
