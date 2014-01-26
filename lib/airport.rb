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
  	@planes = []
	end	

	def planes_landed
		@planes_landed ||= []
	end
end