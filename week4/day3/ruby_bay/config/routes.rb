Rails.application.routes.draw do
  # USER ROUTES
  get "/users/new"          => "users#new"
  post "/users"      => "users#create"
  post "/users/:id/destory" => "users#destroy"
  get  "/users/:id"         => "users#view"

  #
end
