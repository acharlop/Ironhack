class TextInspectionsController < ApplicationController
	def new
		render "new"
	end
	def create
		@text = ActionController::Base.helpers.strip_tags(params[:text_inspection][:user_text])
		words = @text.split(" ")
		
		@word_count = words.length
		decimal = @word_count / 275.0
		@seconds = (decimal * 3600).to_i
		@minutes, @seconds = decimal.divmod(1)
		@seconds = (@seconds * 60).round

		@frequent_words = words.inject(Hash.new(0)){|w,e| w[e] += 1
											w}.sort_by{|k,v| -v}[0..9]

		@longest_sentence = @text.split(".").max

		@longest_words = words.uniq.max_by(10){|w| w.length}.sort_by{|w|-w.length}
		render "results"
	end
end
