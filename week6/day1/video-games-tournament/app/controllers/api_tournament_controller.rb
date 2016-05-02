class ApiTournamentController < ApplicationController
	def index
  	tournaments = Tournament.all
  	render json: tournaments
	end

	def show
		tournament = Tournament.find_by(id: params[:id])
		unless tournament
			render json: {error: "tournament not found"}, status: 404
			return
		end

		render json: tournament
	end

	def create
		tournament = Tournament.new(tournament_params)
		unless tournament.save
			render json: {error: "tournament not created"}, status: 404
			return
		end

		render json: tournament, status: 201
	end

	def destroy
		tournament = Tournament.find_by(id: params[:id])
		unless tournament
			render json: {error: "tournament not found"}, status: 404
			return
		end

		tournament.destroy
		render json: tournament
	end

	private

	def tournament_params
		params.require(:tournament).permit(:name)
	end
end
