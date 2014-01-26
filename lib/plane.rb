class Plane

	def initialize
		self.status= :flying
	end

	attr_accessor :status
#def status=(value)
#		@status = value
#	end

	
	def takeoff weather

		self.status= weather.good_to_fly? ? :flying : :landed
	end

	def land airport
		self.status= :landed
	end

end