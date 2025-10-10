Rails.application.routes.draw do
  root "posts#index"

  devise_for :users

  resources :posts, only: [:index, :show, :new, :create]
  resources :mypages, only: [:index, :show]  # 用户搜索/用户详情
end
