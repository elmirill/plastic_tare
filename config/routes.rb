Rails.application.routes.draw do
  devise_for :admins
  resources :pages
  resources :products
  resources :categories
#  resources :contacts
  root 'pages#show', id: 1

  get 'delivery', to: 'pages#show', id:3
  get 'about', to: 'pages#show', id:2
  get 'cert', to: 'pages#show', id:4


end
