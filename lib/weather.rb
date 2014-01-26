class Weather

	def initialize 

		self.good_to_land= true
		self.good_to_fly= true		
	end

	def good_to_fly= (yesOrNo)
		@good_to_fly = yesOrNo
	end
	def good_to_fly?
  	@good_to_fly
	end

	def good_to_land= (yesOrNo)
		@good_to_land = yesOrNo
	end
	def good_to_land?
		@good_to_land
	end
	
	def conditions
		good_to_land = rand(1..10) != 10
		good_to_fly = @good_to_land
		good_to_fly
	end
end