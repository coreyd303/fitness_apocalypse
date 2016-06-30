Rails.application.routes.draw do
  root 'home#index'

  resources :events, only: [:index, :show]
  resources :blog_posts, only: [:index, :show]
  resources :wods, only: [:show]
end
