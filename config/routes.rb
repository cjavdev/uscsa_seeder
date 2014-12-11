Rails.application.routes.draw do
  root to: 'events#index'
  devise_for :users

  resources :meets do
    resources :events
  end
  resources :athletes
  resources :shchools
end
