Rails.application.routes.draw do
  root 'books#index'

  resources :users
  resources :books, only: [:create, :update, :destroy]

  resources :authors, except: :show do
    resources :books
  end
end
