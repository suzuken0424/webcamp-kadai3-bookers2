Rails.application.routes.draw do
  # get 'users/show'
  get "home/about" => "homes#about"
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:show, :edit, :update, :create, :index]
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
end
