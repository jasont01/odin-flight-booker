Rails.application.routes.draw do
  get 'static_pages/home'
  root to: 'static_pages#home'
  resources :flights
  resources :bookings
end
