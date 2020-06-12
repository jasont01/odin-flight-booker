Rails.application.routes.draw do
  get 'passengers/show'
  get 'static_pages/home'
  root to: 'static_pages#home'
  resources :flights
  resources :bookings
  resources :passengers
end
