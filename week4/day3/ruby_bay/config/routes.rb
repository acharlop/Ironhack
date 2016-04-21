Rails.application.routes.draw do
  # USER ROUTES
  resources :users do
    resources :products
  end
end
