Rails.application.routes.draw do
  resources :feedback_paths
  resources :feedbacks
  resources :path_offers
  resources :type_vehicles
  resources :vehicles
  resources :preferences
  resources :profiles
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#home'
  get 'about' => 'pages#about'
 # get 'search' => 'pages#search'
  get '/search' => 'path_offers#search', :as => 'search_path_offers'
  get 'message' => 'pages#message'
  get 'edit_profile' => 'profiles#edit'
end
