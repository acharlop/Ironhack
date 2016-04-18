class TextInspectionsController < ApplicationController
	def new
		render "new"
	end
	def create
		@text = params[:text_inspection][:user_text]
		@word_count = @text.split(" ").length
		decimal = @word_count / 275.0
		@seconds = (decimal * 3600).to_i
		@minutes, @seconds = decimal.divmod(1)
		@seconds = (@seconds * 60).round
		render "results"
	end
end
