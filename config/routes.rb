Rails.application.routes.draw do
  get 'about', to: 'pages#about'

  devise_for :users
  root to: 'pages#home'

  # pets routes by anna
  get "pets", to: "pets#index"
  get "pets/create", to: "pets#create"
  get "pets/:id/edit", to: "pets#edit"
  get "pets/:id", to: "pets#show"
  delete "pets/:id", to: "pets#destroy"

#   resources :pets, except: [:edit, :update] do
#     resources :bookings, only: [:new, :create]
#   end
#   resources :bookings, only:[:destroy]
# end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
