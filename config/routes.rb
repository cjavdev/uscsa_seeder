Rails.application.routes.draw do
  root to: 'meets#index'
  devise_for :users, controllers: { invitations: 'captain_invitations' }

  resources :athletes, only: [:index, :show, :create, :update]
  resources :captains, only: [:index]
  resources :officers, only: [:index, :destroy]

  resources :meets, only: [:index, :show, :create, :destroy] do
    resources :events, only: [:create]
  end

  resources :events, only: [:show, :destroy] do
    resources :seeds, only: [:create, :update]
  end

  resources :schools, except: [:new, :edit] do
    resources :teams, only: [:index, :create]
  end
  resources :teams, only: [:show, :destroy]
  resources :reports, only: [:index, :show]
  resources :event_seeding_reports, only: [:show, :create, :update]
end
