require_relative "errors.rb"
class Movie
	attr_reader :title, :rating, :buzz, :roles, :salarys
	def initialize(movie)
		# DISABLED FOR TESTING

		# i = Imdb::Search.new(movie)
		# info = i.movies[0]
		@title = "Star Wars (1977)"#info.title
		@rating = 8.7#info.rating
		@buzz = 1
		@roles = {:director=>[],:star=>[],:cast=>[],:writer=>[],:producer=>[]}
		@salarys = {}
	end
	def add_worker(person,role,salary=100000)
		if largest_salary && salary > largest_salary
			raise CantBelieveIt
		end
		@roles[role].push(person)
		if @salarys.has_key?(person)
			@salarys[person] += salary
		else
			@salarys[person] = salary
		end
	end
	def fire_worker(person)
		@roles.each{ |key, role| 
			role.delete_if{|woker| worker == person}
		}
	end
	def endorse(person)
		role = get_roll(person)
		if !role.empty?
			if role[:director]
				@buzz += 2
			else
				@buzz += 1
			end
		end
	end
	def non_worker_endorse(person,roll)
		if roll != :writer
			@buzz *=2
		end
	end
	def largest_salary
		if !@salarys.empty? 
			@salarys.values.max
		else
			false
		end
	end
	private
	def get_roll(person)
		@roles.select do |key, val|
			val.include?(person)
		end
	end
end