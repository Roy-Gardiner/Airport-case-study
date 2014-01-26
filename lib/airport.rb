require_relative 'airTrafficControl'

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