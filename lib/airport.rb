require_relative 'airTrafficControl'

# So, this class doesn't include or use ATC that actually has the planes.
# The only thing this class does is to count the number of planes.
# It's a really unconventional way to split the responsibility: one class
# holds the planes but doesn't care about their number (ATC) and another one
# knows the capacity and planes number but doesn't hold the planes (Airport)
# Hmm, once again fail to understand.  ATC controls the planes, whether they are
# on the ground or flying.  Only one list of planes, held by ATC; less chance of error?

class Airport

	DEFAULT_CAPACITY = 5

	#include AirTrafficControl

	def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  attr_writer :capacity

  def initialize(options = {})
  	self.capacity = options.fetch(:capacity,capacity)
  	#@planes = []
  	@planes_landed = 0
	end	

	def is_full?
		@planes_landed == @capacity
	end
	
	def planes?
		@planes_landed
	end
	
	def landed 
		@planes_landed += 1
	end
	
	def taken_off
		@planes_landed -= 1
	end
end