class AsciisController < ApplicationController
	def new
		render "new"
	end
	def create
		art = Artii::Base.new :font => "slant"
		@text = art.asciify(params[:asciify])

		render "result"
	end
end
