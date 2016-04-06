class PointOfInterest
	attr_reader :name, :criterias
	def initialize(name)
		@name = name
		@criterias = {
			:visits => 0,
			:comments => [],
		}
	end
	def add_visit
		@criterias[:visits] += 1
	end
	def number_of_visits
		@criterias[:visits]
	end
	def add_comment(comment)
		@criterias[:comments].push(comment)
	end
	def number_of_comments
		@criterias[:comments].length
	end
	def a_count
		@name.downcase.count("a")
	end
	def avg_words_per_comment
		arr = @criterias[:comments]
		return 0 if arr.empty?
		s = arr.reduce(0){|sum, cmnt| sum + cmnt.split(" ").length } 
		s.to_f / arr.length
	end
	def add_criteria(criteria,default_val)
		@criterias[criteria.to_sym] = default_val
	end
end