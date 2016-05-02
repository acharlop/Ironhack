class TournamentsController < ApplicationController

  def create

  end

  private

  def tournament_params
  	require(:tournament).allow(:name)
  end
end
