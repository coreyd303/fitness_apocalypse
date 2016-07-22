Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root 'home#index'

  get 'login/new', as: :login

  resources :events, only: [:index, :show]
  resources :blog_posts, only: [:index, :show]

  resources :wods, only: [:index, :show]

  namespace :admin do
    root 'dashboard#index'
    resources :dashboard, only: :index
      get 'dashboard/wods_index', to: 'dashboard#wods_index', as: :wods_index


    resources :blog_posts, except: :destroy
    resources :wods, except: [:show, :destroy]
  end
end
