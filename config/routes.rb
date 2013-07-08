# encoding: utf-8

Financial::Application.routes.draw do
  resources :sales, except: [:edit, :update, :destroy]

  get 'ping', to: 'home#ping'
  root to: 'home#index'
end
