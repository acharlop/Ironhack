class City
	def initialize(name)
		@name = name
		@pois = []
	end
	def add_poi(poi)
		@pois.push(poi)
	end
	def count_pois
		@pois.length
	end
	def search(key,direction)
		arr = []
		arr = @pois.sort_by{|poi| poi.send(key) }
		if direction == :ASC
			arr
		elsif direction == :DESC
			arr.reverse
		end
	end
end