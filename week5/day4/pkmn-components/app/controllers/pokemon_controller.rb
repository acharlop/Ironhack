class PokemonController < ApplicationController
  def index
    response = PokemonApi.request("pokemon")
    @pokemon = response["results"]
    render(:index)
  end
end
