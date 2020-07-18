Rails.application.routes.draw do
  resources :vehicles
  resources :preferences
  resources :profiles
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#home'
  get 'about' => 'pages#about'
  get 'search' => 'pages#search'
  get 'message' => 'pages#message'
  get 'edit_profile' => 'profiles#edit'
end
