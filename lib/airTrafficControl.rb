require 'plane'

class AirTrafficControl

	def initialize
		@planes = []
	end

	def new_plane
  	this_plane = Plane.new
  	self.planes= this_plane
  	this_plane
  end 

	def planes 
		@planes ||= []
	end
	def planes= plane 
		@planes << plane
	end
	
	def planes_flying?
		planes != []
	end
end