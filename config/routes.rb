Rails.application.routes.draw do
  root to: "ads#index"

  resources :ads
  resources :jobs
  resources :users, only:[:create, :show, :edit, :update, :index]

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "sessions", to: "sessions#create", as: "sessions"
  get 'logout', to: 'sessions#destroy', as: :logout

end
