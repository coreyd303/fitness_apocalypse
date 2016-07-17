Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get 'login/new', as: :login

  resources :events, only: [:index, :show]
  resources :blog_posts, only: [:index, :show]
  resources :wods, only: [:show]

  namespace :admin do
    resources :wods, except: [:show, :destroy]
  end
end
