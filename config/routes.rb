Rails.application.routes.draw do
  resources :categoria
  resources :detalle_carritos
  resources :carritos
  resources :usuarios
  resources :productos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
