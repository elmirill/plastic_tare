Rails.application.routes.draw do
  get 'price_lists/show'

  get 'comparison_items/create'

  get 'comparison_items/update'

  get 'comparison_items/destroy'

  get 'comparisons/show'

  devise_for :admins
  resources :pages
  resources :products
  resources :categories
#  resources :contacts
	resources :promos, only: [:edit, :update]
	resource :cart, only: [:show] do
		collection do
			get 'empty'
		end
	end
  resources :order_items, only: [:create, :update, :destroy]
	resource :comparison, only: [:show] do
		collection do
			get 'empty'
		end
	end
  resources :comparison_items, only: [:create, :update, :destroy]
	resources :price_lists, only: [:edit, :update]
  root 'pages#show', id: 1

  get 'delivery', to: 'pages#show', id:3
  get 'about', to: 'pages#show', id:2
  get 'cert', to: 'pages#show', id:4
	get 'price', to: 'price_lists#edit'
	
end
