class Plane

	def initialize
		self.status= :flying
	end

	attr_accessor :status
#def status=(value)
#		@status = value
#	end

	
	def takeoff airport, weather

		if weather.good_to_fly?
			self.status=  :flying
			airport.taken_off
		else
			self.status=  :landed
		end	
	end

	def land airport, weather
		
		if !airport.is_full? && weather.good_to_land?
			self.status=  :landed 
			airport.landed
		else
			self.status=  :flying			
		end	
	end

end