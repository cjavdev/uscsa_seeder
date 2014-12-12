Rails.application.routes.draw do
  root to: 'events#index'
  devise_for :users, controllers: { invitations: 'captain_invitations' }

  resources :meets
  resources :teams
  resources :events
  resources :athletes
  resources :schools
  resources :captains
  resources :officers
end
