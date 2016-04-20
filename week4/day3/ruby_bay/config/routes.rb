Rails.application.routes.draw do
  # USER ROUTES
  post "/users/new"         => "users#new"
  post "/users/create"      => "users#create"
  post "/users/:id/destory" => "users#destroy"
  get  "/users/:id"         => "users#show"

  #
end
