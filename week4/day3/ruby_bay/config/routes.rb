Rails.application.routes.draw do
  # USER ROUTES
  get "/users"              => "users#index"
  post "/users"             => "users#create"
  get "/users/new"          => "users#new"
  post "/users/:id/destroy" => "users#destroy"
  get  "/users/:id"         => "users#view"

  #
end
