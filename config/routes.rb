Rails.application.routes.draw do
  root 'books#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users

  resources :books, only: [:create, :update, :destroy]
  resources :authors, except: :show do
    resources :books
  end
end
