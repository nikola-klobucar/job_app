Rails.application.routes.draw do
  resources :ads
  resources :jobs
  root to: "ads#index"
end
