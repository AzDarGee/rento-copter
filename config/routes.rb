Rails.application.routes.draw do

  root 'properties#index'

  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]

  resources :properties do
    resources :visitations, only: :create
    resources :addresses, only: :create
  end

end
