Rails.application.routes.draw do
  root to: "ads#index"

  resources :ads
  resources :jobs
  resources :users, except: [:new]

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "sessions", to: "sessions#create", as: "sessions"
  delete 'logout', to: 'sessions#destroy', as: :logout

end
