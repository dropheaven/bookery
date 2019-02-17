Rails.application.routes.draw do
  root 'books#index'
  resources :authors, except: :show do
    resources :books
  end

  resources :books, only: [:create, :update, :destroy]
end
