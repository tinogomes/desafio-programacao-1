# encoding: utf-8

Financial::Application.routes.draw do
  resources :sales, except: [:edit, :update, :destroy]

  root to: 'home#index'
end
