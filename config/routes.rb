Rails.application.routes.draw do
  root to: "users#new"

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :experiences, only: [:new, :create, :update]
  resource :resume, only: [:edit]
end
