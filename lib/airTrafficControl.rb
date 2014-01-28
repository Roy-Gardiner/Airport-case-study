require 'plane'

# the file name should use snake_case: air_traffic_control.rb
class AirTrafficControl

	def initialize
		@planes = []
	end

	def new_plane
  	this_plane = Plane.new
    # this notation implies that you're assigning the entire attribute planes
    # You should have done either self.planes << this_plane or self << this_plane
    # ?  next line uses the method to add the plane to the list -- don't understand
    # the criticism
  	self.planes= this_plane
  	this_plane
  end 

	def planes 
		@planes ||= []
	end

  # the method name doesn't make sense
  # because it implies reassignment of the entire attribute
  # and not simply a modification
  # you could have done
  # def << plane  
  # don't undersand the criticism.
	def planes= plane 
		@planes << plane
	end
	
	def planes_flying?
		!planes.empty?
	end
end