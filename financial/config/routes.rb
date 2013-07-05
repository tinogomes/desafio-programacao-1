# encoding: utf-8

Financial::Application.routes.draw do
  resources :importer, only: [:index, :create]

  root to: 'home#index'
end
