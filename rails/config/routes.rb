XhabUi::Application.routes.draw do
  match '/spots/:id/command', via: :post, to: 'spots#command'
  match '/spots/:id/configure', via: :post, to: 'spots#configure'
  resources :dashboards, only: ['index'] 
  resources :rogrs, only: ['update']
  resources :spots, only: ['index', 'show', 'update']
  resources :data, only: ['index']
  match '/data/current', via: :get, to: 'data#current'
  match '/bare-bones', via: :get, to: 'test_interface#index'
end
