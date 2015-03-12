Rails.application.routes.draw do
  resources :cats
  resources :cat_rental_requests
  resources :users
  resource :session
end
