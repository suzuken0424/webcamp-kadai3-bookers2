Rails.application.routes.draw do
  # get 'users/show'
  get "home/about" => "homes#about"
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:show, :edit, :update, :create, :index]
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end
