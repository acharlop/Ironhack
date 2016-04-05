require "sinatra"
require "artii"
require "sinatra/reloader"

get "/ascii/:word/?:font?/?:secret?/?" do
	if  params[:captures] == ["lion","special","secret"]
		erb(:lion)
	else
		font_list = ["alligator","3-d","3x5","acrobatic","avatar","banner /3/4","cosmic","defleppard","doh","epic","fraktur"]
		font = font_list.include?(params[:font]) ? params[:font] : 'slant'
		my_ascii = Artii::Base.new :font => font
		@word = my_ascii.asciify(params[:word])
		erb(:ascii)
	end
end