Rails.application.routes.draw do
  root 'books#index'
  resources :books, only: [:new, :create, :update, :destroy]
  resources :authors, only: [:index, :show] do
    resources :books, only: [:index, :show, :new, :edit]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/auth/github/callback', to: 'sessions#create'

  resources :users
  resources :comments, only: :create
  resources :genres, only: :show
end
