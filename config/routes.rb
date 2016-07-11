Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root 'home#index'

  get 'login/new', as: :login

  resources :events, only: [:index, :show]
  resources :blog_posts, only: [:index, :show]
  resources :wods, only: :show

  namespace :admin do
    resources :dashboard, only: :index
    resources :blog_posts, except: :destroy
  end
end
