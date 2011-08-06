LeedsHack2::Application.routes.draw do
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  get "join" => "users#new", :as => "join"
  get "dashboard" => "dashboard#home", :as => "dashboard"
  root :to => "sessions#new"
  resources :foods
  resources :weights
  resources :users
  resources :sessions
  resources :dashboard do
    collection do 
      get 'home'
    end
  end
end
