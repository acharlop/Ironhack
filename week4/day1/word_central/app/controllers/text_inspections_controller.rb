class TextInspectionsController < ApplicationController
	def new
		render "new"
	end
	def create
		@text = params[:text_inspection][:user_text]
		words = @text.split(" ")
		
		@word_count = words.length
		decimal = @word_count / 275.0
		@seconds = (decimal * 3600).to_i
		@minutes, @seconds = decimal.divmod(1)
		@seconds = (@seconds * 60).round

		@frequent_words = words.inject(Hash.new(0)){|w,e| w[e] += 1
											w}.sort_by{|k,v| -v}[0..9]
		render "results"
	end
end
