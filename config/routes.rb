Rails.application.routes.draw do
  root to: 'meets#index'
  devise_for :users, controllers: { invitations: 'captain_invitations' }

  resources :athletes
  resources :captains
  resources :officers

  resources :meets do
    resources :events, shallow: true
    resources :seeds, shallow: true
  end

  resources :schools do
    resources :teams, shallow: true
  end
end
