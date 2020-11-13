Rails.application.routes.draw do
  resources :mars_rovers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'mars_rovers#index'
end
