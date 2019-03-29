Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "solicitudes#index"
  resources :solicitudes do
  	get 'search', on: :collection
  	get 'valorar/:valor', to: 'solicitudes#valorar', as: :valorar
  	resources :comments	
  end  
end
