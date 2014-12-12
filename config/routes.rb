Rails.application.routes.draw do
  root to: 'meets#index'
  devise_for :users, controllers: { invitations: 'captain_invitations' }

  resources :meets do
    resources :events, only: [:create]
  end
  resources :events, only: [:destroy]

  resources :teams
  resources :athletes
  resources :schools
  resources :captains
  resources :officers
end
