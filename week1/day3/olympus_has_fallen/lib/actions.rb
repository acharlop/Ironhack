require 'colorize'
class Action
	attr_reader :action, :response, :prompt, :game_over
	def initialize(die: false, action: "look", prompt: "There might be something interesting around here lets take a look around", response: "This used to be a majestic building, how did things get so bad?")
		@action = action
		@response = response
		@game_over = die
		@prompt = prompt.gsub(action, @game_over ? action.red : action.blue)
	end

	def perform
		puts "\n" << @response
	end
end
