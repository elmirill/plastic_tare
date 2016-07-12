Rails.application.routes.draw do

  get 'contact_forms/new'
  get 'contact_forms/create'
#  get 'price_lists/show'
  get 'comparison_items/create'
  get 'comparison_items/update'
  get 'comparison_items/destroy'
  get 'comparisons/show'
	get '/delivery', to: 'pages#show', id: 3, as: :delivery
  get '/about', to: 'pages#show', id: 2, as: :about
	get '/cert', to: 'pages#show', id: 4, as: :cert
  get '/scrap', to: 'pages#show', id: 5, as: :scrap
	get '/price_list', to: 'price_lists#edit', as: :price_list
  resource :price_list, only: :update
	get '/edit_core_settings', to: 'core_settings#edit', id: 1, as: :edit_core_settings
	get '/edit_promos', to: 'promos#edit', id: 1, as: :edit_promos
	post '/send_form', to: 'contact_form_mailer#send_form', as: :send_form
	get '/edit_prices', to: 'products#edit_prices_and_positions', as: :edit_prices
	put '/update_prices', to: 'products#update_prices_and_positions', as: :update_prices
	get 'send_order_email', to: 'orders#send_order_email', as: :send_order_email
	
	devise_for :admins, controllers: { registrations: 'registrations'}
	scope "/manage" do
		resources :admins, only: [:index, :destroy]
	end
	devise_scope :admin do
		get "/admin" => "devise/sessions#new"
	end
	
  resources :pages
  resources :products
	resources :categories, except: :show
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
	resources :applications
	
  root 'pages#show', id: 1
	
end
