Rails.application.routes.draw do
  get "/home", to: "pages#home"

  # USER ROUTES
  devise_for :users
  root to: "pages#home"
  get "pets", to: "pets#index"
  post "pets", to: "pets#create"

  # PETS ROUTES by anna and simone added new
  get "pets", to: "pets#index"
  post "pets", to: "pets#create"
  get "pets/new", to: "pets#new"
  get "pets/:id/edit", to: "pets#edit"
  get "pets/:id", to: "pets#show"
  delete "pets/:id", to: "pets#destroy"

  # BOOKINGS ROUTES
  get "bookings", to: "bookings#"
  post "bookings/new", to: "bookings#create"
  get "bookings/new", to: "bookings#new"
  get "bokings/:id/edit", to: "bookings#edit"
  get "bookings/:id", to: "bookings#show"
  delete "bookings/:id", to: "bookings#destroy"

end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
