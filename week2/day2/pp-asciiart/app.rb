require "sinatra"
require "artii"
require "sinatra/reloader"

get "/ascii/:word" do
	my_ascii = Artii::Base.new :font => 'slant'
	@word = my_ascii.asciify(params[:word])
	erb(:ascii)
end