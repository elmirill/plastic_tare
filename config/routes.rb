Rails.application.routes.draw do

  get 'contact_forms/new'
  get 'contact_forms/create'
  get 'price_lists/show'
  get 'comparison_items/create'
  get 'comparison_items/update'
  get 'comparison_items/destroy'
  get 'comparisons/show'
  get 'delivery', to: 'pages#show', id:3
  get 'about', to: 'pages#show', id:2
  get 'cert', to: 'pages#show', id:4
	get 'price', to: 'price_lists#edit'
	get 'edit_core_settings', to: 'core_settings#edit', id:1
	match '/send_form', to: 'contact_form_mailer#send_form', via: 'post'

	devise_for :admins, controllers: { registrations: 'registrations'}
	scope "/manage" do
		resources :admins, only: [:index, :destroy]
	end
  resources :pages
  resources :products
  resources :categories
	resources :promos, only: [:edit, :update]
	resource :order do
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
	resources :contact_forms, only: [:new, :create]
	resources :core_settings, only: [:new, :create, :edit, :update]
	
  root 'pages#show', id: 1
	
end
