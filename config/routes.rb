Rails.application.routes.draw do
  root to: 'pages#home'

  get 'about', to: 'pages#about'
  get 'bye', to: 'pages#bye'
  get 'directions', to: 'pages#directions'
  get 'home', to: 'pages#home'

  resources :participants
  resource :reading, only: [:show, :create]
  resources :activities

  get 'dashboard', to: 'dashboard#show'
  get 'dashboard/participants', defaults: { format: :csv }
  get 'dashboard/readings', defaults: { format: :csv }
  get 'dashboard/activities', defaults: { format: :csv }
end
