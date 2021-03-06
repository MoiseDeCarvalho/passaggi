Rails.application.routes.draw do
  resources :messages
  resources :scores
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
  get '/admin-utenti'           => 'pages#admin_utenti',              :as => 'admin_utenti'
  get '/message_received'       => 'messages#message_received',       :as => 'message_received'
  get '/admin-paths'            => 'path_offers#admin_paths',         :as => 'admin_paths'
  get '/search'                 => 'path_offers#search',              :as => 'search_path_offers'
  get '/search-result'          => 'path_offers#search_result',       :as => 'search_result_path_offers'
  get '/update-path-booked'     => 'path_offers#update_path_booked' , :as => 'update_path_booked_path_offers'
  get '/delete-path-booked'     => 'path_offers#delete_path_booked' , :as => 'delete_path_booked_path_offers'
  get '/feedback-ricevuti'      =>  'feedbacks#feedback_ricevuti'   , :as => 'feedback_ricevuti'
  get '/disattiva'              => 'profiles#disattiva',              :as => 'disattiva'
  get '/riattiva'               => 'profiles#riattiva',               :as => 'riattiva'
  get '/update-messaggio-read'  => 'messages#update_messaggio_read' , :as => 'update_messaggio_read_messages'
  get '/used'                   => 'path_offers#used' ,               :as => 'used_path_offers'
  get 'edit_profile'            => 'profiles#edit'

  get '/vehicles_search' => 'vehicles#vehicles_search',               :as => 'vehicles_search'
  #get '/search-result' => 'path_offers#search_result', :as => 'search_result_path_offers'
end
