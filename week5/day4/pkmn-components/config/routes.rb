Rails.application.routes.draw do
  root(:to => "pokemon#index")

  get("/api(/v2)/*uri", :to => "pokemon_api#forward")
end
