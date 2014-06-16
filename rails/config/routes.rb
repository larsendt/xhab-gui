XhabUi::Application.routes.draw do
  resources :dashboards, only: ['index'] 
  resources :rogrs, only: ['update']
  resources :spots, only: ['index', 'show', 'update']
  resources :data, only: ['index']
  match '/data/current', via: :get, to: 'data#current'
  match '/bare-bones', via: :get, to: 'test_interface#index'
end
