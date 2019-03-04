Rails.application.routes.draw do
  root 'books#index'

  # sessions 
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/auth/github/callback', to: 'sessions#create'

  get '/books/latest', to: 'books#latest'

  resources :users
  resources :comments, only: :create

  resources :books, only: [:new, :create, :update, :destroy]

  resources :authors, except: :show do
    resources :books
  end
end
