class PlayersController < ApplicationController

	def index
		players = Player.all
		render json: players
	end

	def create
		player = Player.new(player_params)
		unless player.save
			render json: {error: "player not created"}, status: 404
			return
		end

		render json: player
	end

	def show
		player = Player.find_by(id: params[:id])
		unless player
			render json: {error: "player not found"}, status: 404
			return
		end

		render json: player
	end

	def destroy
		player = Player.find_by(id: params[:id])
		unless player
			render json: {error: "player not found"}, status: 404
			return
		end

		player.destroy
		render json: player
	end


	private

	def player_params
		params.require(:player).permit(:name)
	end

end
