LeedsHack2::Application.routes.draw do
  get "foods/create"

  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  get "join" => "users#new", :as => "join"
  get "dashboard" => "dashboard#home", :as => "dashboard"
  root :to => "sessions#new"
  resources :users
  resources :sessions
  resources :dashboard do
    collection do 
      get 'home'
    end
  end
  resources :foods
end
