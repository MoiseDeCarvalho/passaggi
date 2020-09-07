Rails.application.routes.draw do
  resources :t1s
  resources :ts
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
  get '/search-result' => 'path_offers#search_result', :as => 'search_result_path_offers'
  get '/update-path-booked' => 'path_offers#update_path_booked' , :as => 'update_path_booked_path_offers'
  get '/delete-path-booked' => 'path_offers#delete_path_booked' , :as => 'delete_path_booked_path_offers'
  get '/used' => 'path_offers#used' , :as => 'used_path_offers'
  get 'message' => 'pages#message'
  get 'edit_profile' => 'profiles#edit'
end
