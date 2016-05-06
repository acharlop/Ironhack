class MatchesController < ApplicationController
	def index
		@matches = Match.joins(:winner)
		render json: @matches
	end

	def show
		matches = Match.joins(:winner).where("winner_faction = ? OR loser_faction = ? ", params[:id], params[:id])
		render json: matches
	end
end
