Rails.application.routes.draw do
  root to: 'events#index'
  devise_for :users

  resources :meets
  resources :teams
  resources :events
  resources :athletes
  resources :shchools
end
