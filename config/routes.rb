Rails.application.routes.draw do
  get 'about',           to: 'pages#about',      as: :about
  get 'contact',         to: 'pages#contact',    as: :contact

  devise_for :users
  root to: 'pages#home'

  resources :users
  resources :pets do
    resources :bookings, only: [:delete,:new, :edit, :update, :create, :show, :index]
  end
  resources :bookings do
    resources :reviews, only: [:new, :create, :show, :index]
  end
end
