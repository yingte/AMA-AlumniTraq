Rails.application.routes.draw do
  resources :role_permissions
  resources :permissions
  resources :roles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
