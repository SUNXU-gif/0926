Rails.application.routes.draw do
  get "users/show"
  get "home/top"
  root "home#top"

  devise_for :users

  get "mypage", to: "users#show"
end
