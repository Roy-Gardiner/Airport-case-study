require 'plane'

class AirTrafficControl

	def initialize
		@planes = []
	end

	def new_plane
  	pl = Plane.new
  	self.planes= pl
  	pl.status
  end 

	def planes 
		@planes ||= []
	end
	def planes= plane 
		@planes << plane
	end
	
	def planes_flying?
		@planes != []
	end
end