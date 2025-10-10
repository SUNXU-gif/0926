Rails.application.routes.draw do
  get "home/top"
  root "home#top"

  devise_for :users

  resources :posts
  resources :favorites, only: [:create, :destroy]
  resources :mypages, only: [:show, :edit, :update]

  get "top", to: "home#top"
end
