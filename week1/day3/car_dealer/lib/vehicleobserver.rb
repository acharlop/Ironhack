
class VehicleObserver
	def initialize(arr)
		@vehicles = arr
	end
	def wheel_counter
		@vehicles.reduce(0){|s,v|s+v.num_wheels}
	end
	def rev_em_up
		@vehicles.each{|v| puts v.sound}
	end
end
