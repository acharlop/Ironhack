Rails.application.routes.draw do
	root to: "login#login"
	post "/login" => "login#try"
	get "/logout" => "login#logout"

  # USER && RESOURCES ROUTES
  resources :users do
    resources :products
  end
# BID ROUTES
	resources :products, only: [:index] do
		resources :bids, only: [:create]
	end
end
